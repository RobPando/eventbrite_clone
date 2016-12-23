# Events
class EventsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    find_upcoming_events
    find_past_events
  end

  def new
    build_event
    @event.invitations.build
    find_users
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      create_invitations unless params[:user_id].nil?
      redirect_to @event
      flash[:success] = 'Event created successfully'
    else
      find_users
      render :new
    end
  end

  def show
    find_event
  end

  def edit
    find_event
    @event.invitations.build
    find_users
  end

  def update
    find_event
    if @event.update_attributes(event_params)
      create_invitations unless params[:user_id].nil?
      flash[:success] = 'Event updated!'
      redirect_to @event
    else
      find_users
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:success] = 'Event successfully deleted.'
    redirect_to current_user
  end

  private

  def event_params
    params.fetch(:event, {}).permit(:name, :description, :location, :date)
  end

  def find_event
    @event ||= events_scope.find(params[:id])
  end

  def find_upcoming_events
    @upcoming_events = events_scope.upcoming_events
  end

  def find_past_events
    @past_events = events_scope.past_events
  end

  def build_event
    @event ||= events_scope.build
  end

  def find_users
    @users ||= User.all
  end

  def events_scope
    Event.all
  end

  def create_invitations
    params[:user_id].each { |id| @event.invitations.create(user_id: id) }
  end

  def correct_user
    find_event
    @user = @event.creator
    redirect_to(root_url) unless current_user?(@user)
  end
end

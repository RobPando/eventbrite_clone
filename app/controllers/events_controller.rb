class EventsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :find_event, only: [:show, :edit, :update]

  def index
    find_upcoming_events
    find_past_events
  end

  def new
    @event = Event.new
    @event.invitations.build
    load_users
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      create_invitations unless params[:user_id].nil?
      redirect_to @event
      flash[:success] = 'Event created successfully'
    else
      redirect_to new_event_path
    end
  end

  def show
    find_event
  end

  def edit
    find_event
    @event.invitations.build
    load_users
  end

  def update
    find_event
    if @event.update_attributes(event_params)
      create_invitations unless params[:user_id].nil?
      flash[:success] = 'Event updated!'
      redirect_to @event
    else
      load_users
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = 'Event successfully deleted.'
    redirect_to current_user
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def find_event
    @event = Event.find_by(id: params[:id])
  end

  def find_upcoming_events
    @upcoming_events = load_events.upcoming_events
  end

  def find_past_events
    @past_events = load_events.past_events
  end

  def load_events
    Event.all
  end

  def load_users
    @users = User.all
  end

  def create_invitations
    params[:user_id].each { |id| @event.invitations.create(user_id: id) }
  end
end

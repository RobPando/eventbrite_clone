class EventsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @upcoming_events = Event.all.upcoming_events
    @past_events = Event.all.past_events
  end

  def new
    @event = Event.new
    @event.invitations.build
    @users = User.all
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      @invites = Event.find(@event.id)
      unless params[:user_id].nil?
        params[:user_id].each { |id| @invites.invitations.create(user_id: id) }
      end
      redirect_to @event
      flash[:success] = "Event was created successfully"
    else
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def edit
    @event = Event.find_by(id: params[:id])
    @event.invitations.build
    @users = User.all
  end
  
  def update
    @event = Event.find_by(id: params[:id])
    if @event.update_attributes(event_params)
      unless params[:user_id].nil?
        params[:user_id].each { |id| @event.invitations.create(user_id: id) }
      end
      flash[:success] = "Event updated!"
      redirect_to @event
    else
      @users = User.all
      render 'edit'
    end
  end
  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event successfully deleted."
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
end

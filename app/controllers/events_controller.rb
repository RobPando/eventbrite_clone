class EventsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]

  def index
    @events = Event.all
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
  end
  def update
  end
  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end
end

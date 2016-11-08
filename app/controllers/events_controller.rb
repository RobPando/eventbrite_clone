class EventsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
    @users = User.all
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event
      flash[:success] = "Event was created successfully"
    else
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @guests = @event.guests
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

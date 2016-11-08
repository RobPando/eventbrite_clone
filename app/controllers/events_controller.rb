class EventsController < ApplicationController
  before_action :logged_in_user

  def new
    @event = current_user.created_events.build
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
    @event = Event.find(params[:id])
    @guests = @event.guests.all
  end

  def edit
  end
  def update
  end
  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :dater)
  end
end

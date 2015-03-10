class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]
  
  def new
    @event = Event.new
  end
  
  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      flash.now[:error] = "Event creation invalid"
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def index
  end
  
  private
  
    def event_params
      params.require(:event).permit(:date, :description)
    end
end

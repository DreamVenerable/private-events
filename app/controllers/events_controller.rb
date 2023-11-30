class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_creator, only: [:new, :create]
  # before_action :set_attandees, only: [:show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendance = @event.attendances.build
  end

  def new
    @event = @creator.created_events.build
  end

  def create
    @event = @creator.created_events.build(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      flash.now[:error] = "Fix your Event!"
      render :new, status: :unprocessable_entity
    end
  end

  private

  # def set_attandees
  #   @attendees
  # end

  def set_creator
    @creator = User.find(current_user.id)
  end

  def event_params
    params.require(:event).permit(:name, :event_datetime, :location, :creator_id)
  end
end

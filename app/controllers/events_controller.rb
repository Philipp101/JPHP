class EventsController < ApplicationController
  require 'mini_magick'

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    params[:event][:photos].each do |photo|
      mini_image = MiniMagick::Image.new(photo.tempfile.path)
      mini_image.resize '1200x1200'
    end
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :eventtext, :eventdate, :links, :photos => [])
  end
end

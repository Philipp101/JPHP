class EventsController < ApplicationController
  require 'mini_magick'

  def index
    @events = Event.all
  end

  def show
    find_event
  end

  def new
    @event = Event.new
  end

  def create
    find_event
    params[:event][:photos].each do |photo|
      mini_image = MiniMagick::Image.new(photo.tempfile.path)
      mini_image.resize '800x800'
    end
    if @event.save
      flash.notice = "CREATED"
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    find_event
  end

  def update
    find_event
    if @event.update(event_params)
      flash.notice = "UPDATED"
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    find_event
    @event.destroy
    flash.notice = "DELETED"
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :eventtext, :eventdate, :links, :photos => [])
  end

  def find_event
    @event = Event.find(params[:id])
  end
end

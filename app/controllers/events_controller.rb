class EventsController < ApplicationController
  require 'mini_magick'
  require 'catalog'
  require 'attachment'
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    find_event
    @catalog = Catalog.where(event_id: @event)
  end

  def new
    @catalog = Catalog.all
    @attachments = Attachment.all
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

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
    flash.alert = "DELETED"
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :eventtext, :eventdate, :links, :photos => [])
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def find_attachment
    @attachment = Attachment.find(params[:id])
  end
end

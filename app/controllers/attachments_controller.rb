class AttachmentsController < ApplicationController
  require 'mini_magick'
  def index
    @attachments = Attachment.all
  end

  def show
    find_attachment
  end

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)
      MiniMagick::Image.new(params[:attachment][:photo].tempfile.path).resize('800x800')
    if @attachment.save
      flash.notice = "CREATED"
      redirect_to attachments_path
    else
      render :new
    end
  end

  def edit
    find_attachment
  end

  def update
    find_attachment
    if @attachment.update(attachment_params)
      flash.notice = "UPDATED"
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    find_attachment
    @attachment.destroy
    flash.alert = "DELETED"
    redirect_to events_path
  end

  private

  def attachment_params
    params.require(:attachment).permit(:caption, :photo)
  end

  def find_attachment
    @attachment = Attachment.find(params[:id])
  end

  def find_event
    @event = Event.find(params[:id])
  end
end

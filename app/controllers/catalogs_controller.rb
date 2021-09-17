class CatalogsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @catalog = Catalog.new
  end

  def create
    @catalog = Catalog.new(catalog_params)
    @event = Event.find(params[:event_id])
    @catalog.event = @event
    if @catalog.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy
    redirect_to event_path(@catalog[:event_id])
  end

  private

  def catalog_params
    params.require(:catalog).permit(:event_id, :attachment_id)
  end
end

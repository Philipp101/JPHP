class BiosController < ApplicationController
  def index
    @bios = Bio.all
  end

  def new
    @bio = Bio.new
  end

  def create
    @bio = Bio.new(bio_params)
    if @bio.save
      flash.notice = "CREATED"
      redirect_to bios_path
    else
      render :new
    end
  end

  def edit
    find_bio
  end

  def update
    find_bio
    if @bio.update(bio_params)
      flash.notice = "UPDATED"
      redirect_to bios_path
    else
      render :edit
    end
  end

  def destroy
    find_bio
    @bio.destroy
    flash.notice = "DELETED"
    redirect_to bios_path
  end

  private

  def bio_params
    params.require(:bio).permit(:title, :bioyear, :institute, :place)
  end

  def find_bio
    @bio = Bio.find(params[:id])
  end
end

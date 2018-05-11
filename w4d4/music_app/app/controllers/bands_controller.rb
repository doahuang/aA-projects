class BandsController < ApplicationController
  before_action :require_log_in
  
  def show
    @band = Band.find(params[:id])
    render :show
  end
  
  def index 
    @band = Band.all
    render :index
  end
  
  def edit 
    @band = Band.find(params[:id])
    if @band
      render :edit
    else
      redirect_to bands_url
    end
  end
  
  def update 
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to bands_url
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to edit_band_url
    end
  end
  
  def new 
    @band = Band.new
    render :new
  end 
  
  def create 
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end
  
  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end
  
  private 
  
  def band_params
    params.require(:band).permit(:name)
  end
end

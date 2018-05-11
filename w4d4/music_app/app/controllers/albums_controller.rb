class AlbumsController < ApplicationController
  before_action :require_log_in
  
  def edit 
    
  end
  
  def update 
    
  end
  
  def new 
    @album = Album.new
    render :new
  end 
  
  def create 
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band)
    else 
      flash[:errors] = @album.errors.full_messages
      render :new
      # redirect_to new_band_album_url(band)
    end
  end
  
  def destroy
    @album = Album.find(params[:id])
    band = @album.band
    @album.destroy
    redirect_to band_url(band)
  end
  
  private 
  
  def album_params
    params.require(:album).permit(:title, :year, :band_id, :studio)
  end
  
end

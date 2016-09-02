class ArtistsController < ApplicationController

  def index
  end

  def new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to @artist
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end

end

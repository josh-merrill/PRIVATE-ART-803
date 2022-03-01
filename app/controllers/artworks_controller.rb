class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.artist = current_user
    @artwork.buyer = current_user

    if @artwork.save!
      redirect_to profile_path, notice: "Your artwork was succesfully created!"
    else
      render :new
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :price, :description, :photo)
  end
end

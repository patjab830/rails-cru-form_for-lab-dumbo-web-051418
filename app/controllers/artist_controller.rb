require 'pry'
class ArtistController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to artist_path(@artist)
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  def delete
    @artist = Artist.find(params[:artist])
    @artist.destroy
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
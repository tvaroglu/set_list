class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def create
    artist = Artist.create(name: params[:name])
    redirect_to "/artists/#{artist.id}"
  end

end

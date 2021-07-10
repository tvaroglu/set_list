class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  ## Rails helper method, to support the #create method (i.e. for a lengthier list of params)
  def artist_params
    params.permit(:name)
  end

  def create
    artist = Artist.create(artist_params)
    redirect_to "/artists/#{artist.id}"
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to "/artists/#{artist.id}"
  end

end

class ArtistSongsController < ApplicationController

  def index
    @artist = Artist.find(params[:id])
    @songs = @artist.songs
  end

end

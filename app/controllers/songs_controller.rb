class SongsController < ApplicationController
  #inhereting from ApplicationController is what makes this class a "controller"

  def index
    ## method exists to point controller to corresponding view
      ## corresponding view gets created via app/views/<controller_name>/index.html.erb
    # must define the call to .all via INSTANCE VARIABLE, or it won't be accessible in the corresponding view via erb tags!
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

end

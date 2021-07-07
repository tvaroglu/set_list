class AddArtistToSongs < ActiveRecord::Migration[5.2]
  def change
    ## shell command to generate file is:
      ## rails g migration AddArtistToSongs artist:references
    ## this creates the ActiveRecord association between the tables, in this example, with artist_id as the foreign key for each song
    add_reference :songs, :artist, foreign_key: true
  end
end

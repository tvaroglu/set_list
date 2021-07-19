class Song < ApplicationRecord
  ## models are the "connection" to our database
    ## inhereting from ApplicationRecord is what makes this class a "model"
  ## class file should be named in the singular (per standard Ruby convention)

  ## the 'many' to 'one' relationship is defined here:
  belongs_to :artist
  ## the 'many' to 'many' relationship is defined here:
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  validates :length, presence: true, numericality: { less_than: 50000 }

  def self.title_search(criteria)
    Song.where("title LIKE '%#{criteria.to_s.downcase}%'")
  end

  def custom_search
    # stuff
  end

  def written_by_artist?(artist)
    Artist.find(artist.id).name != nil
  end

  def artist_name
    Artist.find(artist_id).name
  end

  def other_artist_songs
    all_songs = Song.where(artist_id: self.artist_id).map { |song| song }
    ## Note, be VERY careful with the delete method..
      ## it corresponds with the ActiveRecord delete method...
      ## which can PERMANENTLY delete records from the db...
    ## Acceptable in this scope, due to mapping query to new array
    all_songs.delete(self)
    all_songs
  end

end

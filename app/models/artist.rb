class Artist < ApplicationRecord
  ## ActiveRecord association and reference to known foreign key is configured here:
  has_many :songs
  ## other side of the relationship (songs model) needs similar specification as well!

  validates :name, presence: true
  # validates :name, uniqueness: true
  # validates_uniqueness_of :name
  validates_uniqueness_of :name, :case_sensitive => false

  def played_songs
    # self.songs.where("play_count >= ?", 1).where("length > ?", 0)
    self.songs.where("play_count >= ? AND length > ?", 1, 0).count
  end

  def songs_sorted_alphabetically
    Song.order(:title).where(artist_id: self.id)
  end

  ## ActiveRecord-driven helper method to manually re-create the association
    ## Method written with a different name than then built-in association, to avoid over-writing default behavior
  def all_songs
    Song.where(artist_id: self.id)
  end

  def average_song_length
    self.songs.average(:length).to_f
  end

  def song_count
    self.songs.length
  end

  def wrote_song?(song)
    song.artist.name == self.name
  end

  def wrote__song?(song)
    ## different version of above method, to avoid use of associations
    Song.where(artist_id: self.id).include?(song)
  end

end

class Artist < ApplicationRecord
  ## ActiveRecord association and reference to known foreign key is configured here:
  has_many :songs
  ## other side of the relationship (songs model) needs similar specification as well!

  def average_song_length
    ### question.... why .to_f needed here, but not in the homework video??
    self.songs.average(:length).to_f
  end

end

class Artist < ApplicationRecord
  ## ActiveRecord association and reference to known foreign key is configured here:
  has_many :songs
  ## other side of the relationship (songs model) needs similar specification as well!
end

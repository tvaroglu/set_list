class Song < ApplicationRecord
  ## models are the "connection" to our database
    ## inhereting from ApplicationRecord is what makes this class a "model"
  ## class file should be named in the singular (per standard Ruby convention)

  ## the 'many' to 'one' relationship is defined here:
  belongs_to :artist
end

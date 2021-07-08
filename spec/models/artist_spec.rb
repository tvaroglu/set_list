require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
      it 'returns the average song length' do
        artist = Artist.create!(name: 'Belphegor')
        song1 = artist.songs.create!(title: 'Apophis - Black Dragon', length: 666, play_count: 5000)
        song2 = artist.songs.create!(title: 'Baphomet', length: 525, play_count: 999)

        expect(artist.average_song_length).to eq(((song1.length + song2.length) / 2.to_f).round(1))
      end
    end
  end

end

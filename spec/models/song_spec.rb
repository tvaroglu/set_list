require 'rails_helper'

RSpec.describe Song do
  it {should belong_to :artist}

  describe 'instance methods' do
    before :each do
      @artist = Artist.create!(name: 'Belphegor')
      @song1 = @artist.songs.create!(title: 'Apophis - Black Dragon', length: 666, play_count: 5000)
      @song2 = @artist.songs.create!(title: 'Baphomet', length: 525, play_count: 999)
    end

    describe '#artist' do
      context 'with associations' do
        it 'returns the associated artist object' do
          expect(@song1.artist).to eq(@artist)
        end
      end
      context 'without associations' do
        # Make this test pass WITHOUT using Associations:
        it 'returns the associated artist object' do
          expect(@song1.written_by_artist?(@artist)).to be true
        end
      end
    end

    describe '#artist_name' do
      it 'returns the artists name' do
        # Make this test pass WITH Associations
        expect(@song1.artist_name).to eq(@artist.name)
      end
    end

    describe '#other_artist_songs' do
      it 'returns the other songs by the artist and does not include itself' do
        # Make this test pass WITH Associations
        expect(@song1.other_artist_songs).to eq([@song2])
      end
    end
  end

end

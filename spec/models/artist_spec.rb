require 'rails_helper'

RSpec.describe Artist, type: :model do
  it {should have_many :songs}

  describe 'instance methods' do
    before :each do
      @artist = Artist.create!(name: 'Belphegor')
      @song1 = @artist.songs.create!(title: 'Apophis - Black Dragon', length: 666, play_count: 5000)
      @song2 = @artist.songs.create!(title: 'Baphomet', length: 525, play_count: 999)
    end

    describe '#average_song_length' do
      it 'returns the average song length' do
        expect(@artist.average_song_length).to eq(((@song1.length + @song2.length) / 2.to_f).round(1))
      end
    end

    describe '#songs' do
      context 'with associations' do
        it 'returns all of the associated song objects' do
          expect(@artist.songs).to eq([@song1, @song2])
        end
      end

      context 'without associations' do
        # Make this test pass WITHOUT using Associations
        it 'returns all of the associated song objects' do
          expect(@artist.all_songs).to eq([@song1, @song2])
        end
      end
    end

    describe '#song_count' do
      # Make this test pass WITH Associations
      it 'counts the number of songs' do
        expect(@artist.song_count).to eq(2)
      end
    end

    describe '#wrote_song?' do
      # Write two versions of this method
      context 'with associations' do
        # Version 1 - Make these tests pass WITH Associations
        it 'returns true if the song is associated with the artist' do
          expect(@artist.wrote_song?(@song1)).to be(true)
        end
        it 'returns false if the song is not associated with the artist' do
          diff_artist = Artist.create!(name: 'Different Artist')
          diff_song = diff_artist.songs.create!(title: 'Different Song', length: 0, play_count: 0)

          expect(@artist.wrote_song?(diff_song)).to be(false)
        end
      end

      context 'without associations' do
        # Version 2 - Make these tests pass WITHOUT Associations
        it 'returns true if the song is associated with the artist' do
          expect(@artist.wrote__song?(@song1)).to be(true)
        end
        it 'returns false if the song is not associated with the artist' do
          diff_artist = Artist.create!(name: 'Different Artist')
          diff_song = Song.create!(title: 'Different Song', length: 0, play_count: 0, artist_id: diff_artist.id)

          expect(@artist.wrote__song?(diff_song)).to be(false)
        end
      end
    end

  end

end

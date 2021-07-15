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


  describe 'custom inheritance-driven methods' do
    describe '#last_updated' do
      it 'returns the date the instance was last updated' do
        artist = Artist.create(name: 'Prince')
        song = artist.songs.create(title: 'kiss', play_count: 5832, length: 700)
        updated_time = Time.zone.now

        song.update(title: 'Kiss', updated_at: updated_time)

        expect(song.last_updated).to eq(updated_time.strftime("%Y-%m-%d"))
      end
    end
  end


  describe '::class methods' do
    describe '#sort_by_recently_created' do
      it 'returns songs ordered by most recent creation' do
        artist = Artist.create(name: 'Prince')
        kiss = artist.songs.create(title: 'Kiss', play_count: 8962011, length: 300)
        beret = artist.songs.create(title: 'Raspberry Beret', play_count: 462291, length: 300)
        rain = artist.songs.create(title: 'Purple Rain', play_count: 8000000, length: 300)
        expect(Song.sort_by_recently_created).to eq([rain, beret, kiss])
      end
    end

    describe '#sorted_alphabetically' do
      it 'returns all songs sorted alphabetically WITH inheritance' do
        artist = Artist.create!(name: 'Behemoth')
        song_1 = artist.songs.create!(title: 'Demigod', length: 666, play_count: 5000)
        song_2 = artist.songs.create!(title: 'Conquer All', length: 666, play_count: 5000)

        expected = Song.sorted_alphabetically(Song, :title)

        expect(expected.length).to eq(2)
        expect(expected.first).to eq(song_2)
        expect(expected.last).to eq(song_1)
      end
    end

    describe '#x_shortest' do
      it "returns x number of songs sorted ascending by length" do
        artist = Artist.create!(name: 'Behemoth')
        song_1 = artist.songs.create!(title: 'Total Invasion', length: 789, play_count: 5000)
        song_2 = artist.songs.create!(title: 'Demigod', length: 123, play_count: 5000)
        song_3 = artist.songs.create!(title: 'Conquer All', length: 456, play_count: 5000)

        expected = Song.x_shortest(2, Song, :length)

        expect(expected.length).to eq(2)
        expect(expected.first).to eq(song_2)
        expect(expected.last).to eq(song_3)
      end
    end

    describe '#title_search' do
      xit 'can return a list of songs based on case-insensitive title search' do
        # stuff
      end
    end

    describe '#custom_search' do
      xit 'returns the top 3 songs that have the most plays, a length greater than x, and were updated within the last three days' do
        # stuff
      end
    end
  end

end

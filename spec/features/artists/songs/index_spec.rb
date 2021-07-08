require 'rails_helper'

RSpec.describe 'artists songs index page' do
  # As a user
  # When I visit an Artist's Songs index
  # Then I see the titles of all that Artist's Songs
  # And I see that each title is a link to the Song's show page
  it "can display all of the artist's song titles" do
    artist = Artist.create!(name: 'Belphegor')
    song1 = artist.songs.create!(title: 'Apophis - Black Dragon', length: 666, play_count: 5000)
    song2 = artist.songs.create!(title: 'Baphomet', length: 525, play_count: 999)

    visit "/artists/#{artist.id}/songs"
    save_and_open_page

    expect(page).to have_content(song1.title)
    expect(page).to have_content(song2.title)
  end

  it 'links to each song page' do
    artist = Artist.create!(name: 'Belphegor')
    song1 = artist.songs.create!(title: 'Apophis - Black Dragon', length: 666, play_count: 5000)
    song2 = artist.songs.create!(title: 'Baphomet', length: 525, play_count: 999)

    visit "/artists/#{artist.id}/songs"
    click_on song1.title

    expect(current_path).to eq("/songs/#{song1.id}")
  end

  it 'shows average song length for the artist' do
    artist = Artist.create!(name: 'Belphegor')
    song1 = artist.songs.create!(title: 'Apophis - Black Dragon', length: 666, play_count: 5000)
    song2 = artist.songs.create!(title: 'Baphomet', length: 525, play_count: 999)

    visit "/artists/#{artist.id}/songs"
    save_and_open_page

    expect(page).to have_content("Artist: #{artist.name}")
    expect(page).to have_content("Average song length: #{artist.average_song_length}")
  end

end

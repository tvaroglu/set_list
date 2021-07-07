require 'rails_helper'

RSpec.describe 'the songs show page' do
  ## feature specs are typically for INTEGRATION tests, whereas model specs are typically for UNIT tests
    ## best practice is to comment out the associated user story prior to each test, for readability

  # User Story:  As a visitor, when I visit /songs/1 (where 1 is the id of a song in my database..
    # I see that song's title, and artist...
    # And I do not see any of the other songs in my database
  it 'displays the song title' do
    artist = Artist.create!(name: 'Whitechapel')
    song = artist.songs.create!(title: 'This is Exile', length: 360, play_count: 2000)
    song2 = artist.songs.create!(title: 'Possession', length: 405, play_count: 4000)

    visit "/songs/#{song.id}"
    ## capybara-specific expectations written here:
    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create!(name: 'Whitechapel')
    song = artist.songs.create!(title: 'This is Exile', length: 360, play_count: 2000)
    song2 = artist.songs.create!(title: 'Possession', length: 405, play_count: 4000)

    visit "/songs/#{song.id}"
    ## provide a pop-up window during test execution, for a visual display!
    save_and_open_page

    expect(page).to have_content(artist.name)
  end
end

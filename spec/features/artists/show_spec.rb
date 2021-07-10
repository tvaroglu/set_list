require 'rails_helper'

RSpec.describe 'the artists show page' do
  # As a user
  # When I visit an Artist's show page
  # Then I see the Artist's name
  # And I see the Artist's average song length
  # And I see the Artist's total song count
  it "displays the artist's attributes" do
    artist = Artist.create!(name: 'Belphegor')
    song1 = artist.songs.create!(title: 'Apophis - Black Dragon', length: 666, play_count: 5000)
    song2 = artist.songs.create!(title: 'Baphomet', length: 525, play_count: 999)

    visit "/artists/#{artist.id}"
    # save_and_open_page

    expect(page).to have_content("Artist: #{artist.name}")
    expect(page).to have_content("Average song length: #{artist.average_song_length}")
    expect(page).to have_content("Total song count: #{artist.songs.length}")
  end

end

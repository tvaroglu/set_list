require 'rails_helper'

## not required to included the type: :feature syntax if directory structure is already configured accordingly
RSpec.describe 'songs index page', type: :feature do
  ## As a user,
  ## when I visit '/songs'
  ## I see each song's title and play count
  it 'can see all song titles and play counts' do
    # song1 = Song.create!(title: 'Apophis - Black Dragon', length: 666, play_count: 5000)
    artist1 = Artist.create!(name: 'Belphegor')
    song1 = artist1.songs.create!(title: 'Apophis - Black Dragon', length: 666, play_count: 5000)
    artist2 = Artist.create!(name: 'Cannibal Corpse')
    song2 = artist2.songs.create!(title: 'Scourge of Iron', length: 405, play_count: 4000)

    visit '/songs'
    ## courtesy of launchy gem:
    save_and_open_page

    # Best practice to include most specific syntax to fully test the rendered HTML:
    expect(page).to have_content(song1.title)
    expect(page).to have_content("Length: #{song1.length}")
    expect(page).to have_content("Play Count: #{song1.play_count}")

    expect(page).to have_content(song2.title)
    expect(page).to have_content("Length: #{song2.length}")
    expect(page).to have_content("Play Count: #{song2.play_count}")
  end

end

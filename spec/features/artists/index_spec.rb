require 'rails_helper'

RSpec.describe 'artists index page' do
  it 'can display all artist names' do
    artist1 = Artist.create!(name: 'Belphegor')
    song1 = artist1.songs.create!(title: 'Apophis - Black Dragon', length: 666, play_count: 5000)
    artist2 = Artist.create!(name: 'Cannibal Corpse')
    song2 = artist2.songs.create!(title: 'Scourge of Iron', length: 405, play_count: 4000)

    visit '/artists'
    # save_and_open_page

    expect(page).to have_content(artist1.name)
    expect(page).to have_content(artist2.name)
  end
end

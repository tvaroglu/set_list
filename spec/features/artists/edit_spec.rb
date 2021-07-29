# As a visitor
# When I visit the artists index page
# And click 'Edit' next to an artist
# Then I am taken to an edit artist form
# When I enter a new name for the artist
# And click a button to 'Update Artist'
# Then I am redirected back to the artist's show page
# And I see the updated name

require 'rails_helper'

RSpec.describe 'artist edit page' do
  it 'links to the edit page' do
    artist = Artist.create!(name: 'Beneath the Massacre')
    visit '/artists'
    # save_and_open_page
    
    click_on "Edit: #{artist.name}"

    expect(current_path).to eq("/artists/#{artist.id}/edit")
  end

  it 'can edit the artist' do
    artist = Artist.create!(name: 'Beneath the Massacres')
    visit "/artists"
    # save_and_open_page

    expect(page).to have_content('Beneath the Massacres')

    click_on "Edit: #{artist.name}"

    # visit "/artists/#{artist.id}/edit"
    fill_in 'Name', with: 'Beneath the Massacre'
    click_button 'Update Artist'

    expect(current_path).to eq("/artists/#{artist.id}")
  end
end

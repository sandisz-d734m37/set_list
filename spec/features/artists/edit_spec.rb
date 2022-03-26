require 'rails_helper'

RSpec.describe 'the artist edit' do
  it 'links to the edit page' do
    artist = Artist.create!(name: "Pants")

    visit '/artists'

    click_button "Edit #{artist.name}"

    expect(current_path).to eq("/artists/#{artist.id}/edit")
  end

  it 'can edit the artist' do
    artist = Artist.create!(name: "Pantus")

    visit "/artists"

    expect(page).to have_content('Pantus')

    click_button 'Edit Pantus'

    fill_in "Name", with: "Pants"
    click_button "Update Artist"

    expect(current_path).to eq("/artists")
    expect(page).to have_content('Pants')
  end
end

require 'rails_helper'

RSpec.describe 'Artist creation' do
  it 'links to the new page from the artists index' do
    visit '/artists'

    click_link('New Artist')

    expect(current_path).to eq('/artists/new')
  end

  it 'can create a new artist' do
    visit '/artists/new'

    fill_in('Name', with: 'Prints')
    click_button('Create Artist')

    # new_artist_id = Artist.last.id
    expect(current_path).to eq("/artists")
    expect(page).to have_content("Prints")
  end
end

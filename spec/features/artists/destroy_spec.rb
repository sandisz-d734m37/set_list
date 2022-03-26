require 'rails_helper'

RSpec.describe 'destroying an artist' do
  it 'can delete the artist from the index page' do
    artist = Artist.create(name: "Pants")
    visit '/artists'
    click_button 'Delete'
    expect(current_path).to eq('/artists')
    expect(page).not_to have_content('Pants')
  end
end

require 'rails_helper'

RSpec.describe 'Artist songs index', type: :feature do
  before :each do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
    @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 200, play_count: 12344)
  end
  it 'shows all the song titles of the songs for the artist' do

    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title

    expect(current_path).to eq("/songs/#{@purple.id}")

  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 522.5")
  end
end

require 'rails_helper'

RSpec.describe 'songs index page', type: :feature do
  it 'can see all songs titles and play count' do
    artist_1 = Artist.create!(name: "Guy")
    song_1 = artist_1.songs.create!(title: "I Really Like You",
    length: 208,
    play_count: 124534453)
    song_2 = artist_1.songs.create!(title: "Call Me Maybe",
    length: 199,
    play_count: 12233443)

    visit "/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play count: #{song_2.play_count}")
  end
end

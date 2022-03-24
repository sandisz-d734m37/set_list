require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'displays the song title' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(
      title: "I Really Like You",
      length: 208,
      play_count: 293875
    )
    song_2 = artist.songs.create!(
      title: "Call Me Maybt",
      length: 228,
      play_count: 3293875
    )

    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).not_to have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(
      title: "I Really Like You",
      length: 208,
      play_count: 293875
    )
    song_2 = artist.songs.create!(
      title: "Call Me Maybt",
      length: 228,
      play_count: 3293875
    )

    visit "/songs/#{song.id}"

    expect(page).to have_content(artist.name)
  end
end

require 'rails_helper'

RSpec.describe Artist, type: :model do
  it {should have_many :songs}

  describe 'insrance methods' do
    describe '#average_song_length' do
      before :each do
        @prince = Artist.create!(name: 'prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
        @beret = @prince.songs.create!(title: 'Raspberry Beret', length: 200, play_count: 12344)
        @other_song = @prince.songs.create!(title: 'Another Prince song', length: 1, play_count: 12344)
      end
      it 'returns the average song length' do
        expect(@prince.average_song_length.to_f.round(2)).to eq(348.67)
      end
    end
  end
end

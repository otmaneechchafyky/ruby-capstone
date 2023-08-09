require_relative '../game/game'
require_relative '../game/author'
require 'rspec'
require 'date'

RSpec.describe Game do
  let(:author) { Author.new('John', 'Doe') }

  it "associates with an author and adds the game to author's items" do
    game = Game.new(true, Date.today, {})
    game.associate_with_author(author)

    expect(game.authors).to include(author)
    expect(author.items).to include(game)
  end

  it "cannot be archived if it doesn't meet the conditions" do
    played_at_date = Date.parse('2022-01-01')
    game = Game.new(false, played_at_date, {})

    allow(Date).to receive(:today).and_return(Date.parse('2023-01-01'))

    expect(game.can_be_archived?).to be(false)
  end

  it 'returns a hash representation of the game' do
    game = Game.new(true, Date.parse('2021-01-01'), {})

    expected_hash = {
      multiplayer: true,
      played_at_date: Date.parse('2021-01-01')
    }

    expect(game.to_hash).to eq(expected_hash)
  end
end

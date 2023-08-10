require_relative '../classes/game'
require_relative '../classes/author'
require 'rspec'
require 'date'

RSpec.describe Game do
  let(:author) { Author.new(first_name: 'John', last_name: 'Doe') }
  let(:game) { Game.new(multiplayer: true, played_at_date: Date.today) }

  it "associates with an author and adds the game to author's items" do
    game = Game.new({ multiplayer: true, played_at_date: Date.today })
    author.add_item(game)

    expect(author.items).to include(game)
    expect(game.author).to eq(author)
  end

  it 'cannot be archived if it doesn\'t meet the conditions' do
    allow(Date).to receive(:today).and_return(Date.new(2023, 8, 10))

    game = Game.new({
                      multiplayer: true,
                      played_at_date: Date.new(2022, 1, 1),
                      publish_date: Date.new(2022, 1, 1) # Use Date object here
                    })

    game.move_to_archive

    expect(game.archived).to be(false)
  end

  it 'returns a hash representation of the game' do
    game = Game.new({ multiplayer: true, played_at_date: Date.parse('2021-01-01') })

    expected_hash = {
      multiplayer: true,
      played_at_date: Date.parse('2021-01-01')
    }

    expect(game.to_hash).to eq(expected_hash)
  end
end

require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  before(:each) do
    @my_label = Label.new('title 1', 'Green')
    @my_item = Item.new(
      genre: 'Science Fiction',
      author: 'John Doe',
      source: 'Library',
      label: nil,
      publish_date: '2023-08-10',
      archived: false
    )
  end
  describe 'Check properties' do
    it 'should have correct title' do
      expect(@my_label.title).to eq('title 1')
    end

    it 'should have correct color' do
      expect(@my_label.color).to eq('Green')
    end
  end

  describe 'add_item method' do
    it 'should contain items' do
      @my_label.add_item(@my_item)
      expect(@my_label.items).to eq [@my_item]
    end
  end
end

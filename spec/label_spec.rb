require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  before(:each) do
    @my_label = Label.new('title 1')
    @my_item = Item.new(
      genre: 'Science Fiction',
      author: 'Luis',
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
  end

  describe 'add_item method' do
    it 'should contain items' do
      @my_label.add_item(@my_item)
      expect(@my_label.items).to include(@my_item)
    end

    it 'should add the item to label' do
      @my_label.add_item(@my_item)
      expect(@my_item.label).to eq(@my_label)
    end
  end

  describe 'Label constructor' do
    it 'receives an Item instance' do
      @my_item.add_label(@my_label) # to associate the label with the item
      expect(@my_item.label).to be_an_instance_of(Label)
    end

    it 'should include the item in label items' do
      @my_label.add_item(@my_item)
      expect(@my_label.items).to include(@my_item)
    end

    it 'should match the label instance in the item' do
      @my_item.add_label(@my_label)
      expect(@my_item.label).to eq(@my_label)
    end
  end
end

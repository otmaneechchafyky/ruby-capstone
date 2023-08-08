require_relative '../classes/label'

describe Label do
  before(:each) do
    @label = Label.new('title 1', 'Green')
  end
  describe 'Check properties' do
    it 'should have correct title' do
      expect(@label.title).to eq('title 1')
    end

    it 'should have correct color' do
      expect(@label.color).to eq('Green')
    end
  end

  describe 'add_item method' do
    it 'should contain book item' do
      @label.add_item('book item')
      expect @label.items.to be ['book item']
    end
  end
end

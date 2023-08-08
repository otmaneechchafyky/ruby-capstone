require_relative '../classes/label'

describe Label do
  describe 'Check properties' do
    before(:each) do
      @label = Label.new('title 1', 'Green')
    end

    it 'should have correct title' do
      expect(@label.title).to eq('title 1')
    end

    it 'should have correct color' do
      expect(@label.color).to eq('Green')
    end
  end
end

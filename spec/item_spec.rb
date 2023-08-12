# item unit test
require_relative '../classes/item'

describe Item do
  before(:each) do
    params = {
      genre: 'to be defined',
      author: 'to be defined',
      source: 'the valid source',
      label: 'a label',
      publish_date: '2012-08-01'
    }
    @an_item = Item.new(params)
  end

  after(:each) do
    # p @an_item
  end

  it 'should create an instance of Item' do
    expect(@an_item).to be_an_instance_of Item
  end

  it 'should have a valid id (not nil)' do
    expect(@an_item.id.nil?).to be_falsy
  end

  it 'should have a valid genre (not nil)' do
    expect(@an_item.genre.nil?).to be_falsy
  end

  it 'should have a valid author (not nil)' do
    expect(@an_item.author.nil?).to be_falsy
  end

  it 'should have a valid source (not nil)' do
    expect(@an_item.source.nil?).to be_falsy
  end

  it 'should have a valid label (not nil)' do
    expect(@an_item.label.nil?).to be_falsy
  end

  it 'should have a valid publish_date (not nil)' do
    expect(@an_item.publish_date.nil?).to be_falsy
  end

  it 'should have a valid archived (not nil)' do
    expect(@an_item.archived.nil?).to be_falsy
  end

  it 'move_to_archive sets archived to true if can_be_archive?' do
    @an_item.move_to_archive
    expect(@an_item.archived).to be_truthy
  end
end

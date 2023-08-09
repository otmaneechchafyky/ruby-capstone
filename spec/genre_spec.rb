require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  describe 'tests for Genre class' do
    before(:each) do
      # create an Item instance
      item_params_id = {
        id: 1,
        publish_date: '2023-08-01'
      }
      @new_item = Item.new(item_params_id)

      # set the params to create a Genre instance
      @genre_params_id = {
        id: 1,
        name: 'test genre'
      }
      @new_genre = Genre.new(@genre_params_id)

      @genre_instance = instance_double(Genre)
    end

    context 'when creating a new Genre' do
      it 'should create an instance of Genre' do
        expect(@new_genre).to be_an_instance_of Genre
      end

      it 'should have a valid \'id\'' do
        expect(@new_genre.id.nil?).not_to be_truthy
        expect(@new_genre.id).to be_an_instance_of Integer
      end

      it 'should have a valid \'name\'' do
        expect(@new_genre.name.nil?).not_to be_truthy
        expect(@new_genre.name).to be_an_instance_of String
      end
    end

    context '#add-item method' do
      it 'should receive an Item instance as input' do
        allow(@genre_instance).to receive(:add_item).with(instance_of(Item)).exactly(1)
        @genre_instance.add_item(@new_item)
      end

      it 'should add the input Item to the collection of \'items\'' do
        @new_genre.add_item(@new_item)
        expect(@new_genre.items.include?(@new_item)).to be_truthy
      end

      it 'should add self as a property of the Item object' do
        @new_genre.add_item(@new_item)
        expect(@new_item.genre).to eql @new_genre
      end
    end
  end
end

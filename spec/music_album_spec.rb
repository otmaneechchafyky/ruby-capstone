require_relative '../classes/music_album'
require_relative '../classes/genre'

describe MusicAlbum do
  describe 'tests for \'MusicAlbum\' class' do
    before(:each) do
      # create a MusicAlbum instance
      req_music_album_params = {
        publish_date: '2020-01-01',
        on_spotify: true
      }
      @def_music_album = MusicAlbum.new(req_music_album_params)
      music_album_params_id = {
        id: 1000,
        publish_date: '2023-08-01',
        on_spotify: true
      }
      @new_music_album = MusicAlbum.new(music_album_params_id)
      @music_album_instance = instance_double(MusicAlbum)

      # set the params to create a Genre instance
      @genre_params_id = {
        id: 9999,
        name: 'music album genre'
      }
      @new_genre = Genre.new(@genre_params_id)

      @genre_instance = instance_double(Genre)
    end

    context 'when creating a new \'MusicAlbum\' instance' do
      it 'should create an instance of \'MusicAlbum\'' do
        expect(@new_music_album).to be_an_instance_of(MusicAlbum)
        expect(@def_music_album).to be_an_instance_of(MusicAlbum)
      end

      it 'should be a kind of \'Item\' (inheritance)' do
        expect(@new_music_album).to be_kind_of(Item)
        expect(@def_music_album).to be_kind_of(Item)
      end
    end

    context 'when creating a new \'MusicAlbum\'' do
      it 'should have a valid \'id\' value' do
        expect(@new_music_album.id.nil?).not_to be_truthy
        expect(@new_music_album.id).to be_an_instance_of(Integer)
        expect(@def_music_album.id.nil?).not_to be_truthy
        expect(@def_music_album.id).to be_an_instance_of(Integer)
      end

      it 'should have a valid \'publish_date\' value' do
        expect(@new_music_album.publish_date.nil?).not_to be_truthy
        expect(@new_music_album.publish_date).to be_an_instance_of(Date)
        expect(@def_music_album.publish_date).to be_an_instance_of(Date)
        expect(@def_music_album.publish_date.nil?).not_to be_truthy
      end

      it 'should have a valid \'on_spotify\' value' do
        expect(@new_music_album.on_spotify.nil?).not_to be_truthy
        expect(@new_music_album.on_spotify).to be_kind_of(FalseClass).or be_kind_of(TrueClass)
        expect(@def_music_album.on_spotify.nil?).not_to be_truthy
        expect(@def_music_album.on_spotify).to be_kind_of(FalseClass).or be_kind_of(TrueClass)
      end

      it 'should have a valid \'genre\'' do
        @new_genre.add_item(@new_music_album)
        @new_genre.add_item(@def_music_album)
        expect(@new_music_album.genre).not_to be_nil
        expect(@new_music_album.genre).to be_an_instance_of(Genre)
        expect(@def_music_album.genre).not_to be_nil
        expect(@def_music_album.genre).to be_an_instance_of(Genre)
      end
    end

    context '#can_be_archived? method' do
      it 'should exists' do
        expect(@new_music_album.private_methods(:can_be_archived?)).to be_truthy
      end

      context 'should return \'true\' if' do
        music_album1 = MusicAlbum.new({ publish_date: '2010-01-01', on_spotify: true })
        music_album2 = MusicAlbum.new({ publish_date: '2021-01-01', on_spotify: true })
        music_album3 = MusicAlbum.new({ publish_date: '2021-01-01', on_spotify: false })
        music_album4 = MusicAlbum.new({ publish_date: '2010-01-01', on_spotify: false })
        it 'parent\'s method return \'true\' AND \'on_spotify\' is \'true\'' do
          expect(music_album1.send(:can_be_archived?)).to be_truthy
        end
        it 'otherwise, should return \'false\'' do
          expect(music_album2.send(:can_be_archived?)).to be_falsy
          expect(music_album3.send(:can_be_archived?)).to be_falsy
          expect(music_album4.send(:can_be_archived?)).to be_falsy
        end
      end
    end
  end
end

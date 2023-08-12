require_relative '../classes/book'

describe Book do
  describe 'can_be_archived? method' do
    context 'If cover state is bad' do
      it 'returns true' do
        params = {
          genre: 'Science Fiction',
          author: 'Luis',
          source: 'Library',
          label: 'my label',
          publish_date: '2012-08-01',
          archived: true,
          publisher: 'Pub',
          cover_state: 'bad'
        }
        book = Book.new(params)
        expect(book.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'If cover state is Not bad and date less than 10 years' do
      it 'returns false' do
        params = {
          genre: 'Science Fiction',
          author: 'Luis',
          source: 'Library',
          label: 'my label',
          publish_date: '2023-08-10',
          archived: false,
          publisher: 'Pub',
          cover_state: 'Not bad'
        }
        book = Book.new(params)
        expect(book.send(:can_be_archived?)).to eq(false)
      end
    end

    context 'If cover state is Not bad and date greater than 10 years' do
      it 'returns true' do
        params = {
          genre: 'Science Fiction',
          author: 'Luis',
          source: 'Library',
          label: 'my label',
          publish_date: '2010-01-01',
          archived: false,
          publisher: 'Pub',
          cover_state: 'Not bad'
        }
        book = Book.new(params)
        expect(book.send(:can_be_archived?)).to eq(true)
      end
    end
  end
end

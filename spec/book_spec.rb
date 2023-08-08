require_relative '../book'

describe Book do
  describe 'can_be_archived? method' do
    context 'If cover state is bad' do
      it 'returns true' do
        book = Book.new(
          'Science Fiction', 'John Doe', 'Library',
          'Sample Book', '2010-01-01', true, 'Publisher', 'bad'
        )
        expect(book.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'If cover state is Not bad and date less than 10 years' do
      it 'returns false' do
        book = Book.new(
          'Mystery', 'Jane Smith', 'Bookstore',
          'New Book', '2023-08-10', false, 'Publisher', 'good'
        )
        expect(book.send(:can_be_archived?)).to eq(false)
      end
    end

    context 'If cover state is Not bad and date greater than 10 years' do
      it 'returns true' do
        book = Book.new(
          'Mystery', 'Jane Smith', 'Bookstore',
          'New Book', '2010-01-01', false, 'Publisher', 'good'
        )
        expect(book.send(:can_be_archived?)).to eq(true)
      end
    end
  end
end

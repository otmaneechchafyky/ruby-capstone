require 'json'
require_relative '../classes/app'

class Save
  def save_books(books)
    File.write('./data/books.json', JSON.pretty_generate({ 'Books' => books.map do |book|
      {
        'author' => book.author,
        'genre' => book.genre,
        'source' => book.source,
        'label' => book.label,
        'publish date' => book.publish_date.to_s,
        'archived' => book.archived,
        'publisher' => book.publisher,
        'cover state' => book.cover_state
      }
    end }))
  end

  def read_books
    file_path = './data/books.json'
    return [] unless File.exist?(file_path)

    books_data = JSON.parse(File.read(file_path))
    books_list = []
    books_data['Books'].each do |book_data|
      params = {
        author: book_data['author'],
        genre: book_data['genre'],
        source: book_data['source'],
        label: book_data['label'],
        publish_date: book_data['publish date'],
        archived: book_data['archived'],
        publisher: book_data['publisher'],
        cover_state: book_data['cover state']
      }
      books_list << Book.new(params)
    end
    books_list
  end

  def save_labels(labels)
    File.write('./data/labels.json', JSON.pretty_generate({ 'labels' => labels.map do |label|
      {
        'id' => label.id,
        'title' => label.title,
        'color' => label.color
      }
    end }))
  end

  def read_labels
    file_path = './data/labels.json'
    return [] unless File.exist?(file_path)

    labels_data = JSON.parse(File.read(file_path))
    labels_list = []

    labels_data['labels'].each do |label_data|
      label_data['title']
      label_data['color']
      labels_list << Label.new(label_data)
    end
    labels_list
  end
end

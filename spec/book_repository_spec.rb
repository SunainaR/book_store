require 'book_repository'

# This feels unecessary considering we put the connection details in spec helper - come back to this.
def reset_books_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_books_table
  end
    it "Returns two books" do
      repo = BookRepository.new
      books = repo.all
      expect(books.length).to eq 2
      expect(books[0].id).to eq '1'
      expect(books[0].title).to eq 'Sunny and the Kittens'
      expect(books[0].author_name).to eq 'Sunaina'
      expect(books[1].id).to eq '2'
      expect(books[1].title).to eq 'Meow Diaries'
      expect(books[1].author_name).to eq 'Ninya'
    end
end
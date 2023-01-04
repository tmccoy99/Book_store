require "book_repository"
require "book"

describe BookRepository do
  
  before(:each) do
    @book1 = Book.new("1", "Nineteen Eighty-Four", "George Orwell")
    @book2 = Book.new("2", "Mrs Dalloway", "Virginia Woolf")
    @repo = BookRepository.new

    seed = File.read("spec/test_seed.rb")
    connection = PG.connect({ host: '127.0.0.1',
    dbname: 'book_store_test'})
    connection.exec(seed)
  end

  it "#all returns array of all books" do
    expect(@repo.all).to eq [@book1, @book2]
  end

  it "#delete removes student from database" do
    @repo.delete(@book1)
    expect(@repo.all).to eq [@book2]
  end
end
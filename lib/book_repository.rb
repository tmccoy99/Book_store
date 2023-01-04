require_relative "database_connection.rb"
require_relative "book.rb"

class BookRepository

  def all
    query = "SELECT * FROM books"
    hashes = DatabaseConnection.exec_params(query, [])
    books = hashes.map do |hash|
      Book.new(hash["id"], hash["title"], hash["author_name"])
    end
    books
  end

  def update

  end

  def delete(book)
    query = "DELETE FROM books WHERE id = #{book.id}"
    DatabaseConnection.exec_params(query, [])
  end

end
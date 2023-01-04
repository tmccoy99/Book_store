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

  def update(id_to_update, book)
    query = "UPDATE books SET title = '#{book.title}', " \
    "author_name = '#{book.author_name}' " \
    "WHERE id = #{id_to_update}"
    
    DatabaseConnection.exec_params(query, [])
  end

  def delete(book)
    query = "DELETE FROM books WHERE id = #{book.id}"
    DatabaseConnection.exec_params(query, [])
  end

end
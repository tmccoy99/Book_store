require_relative "lib/database_connection.rb"
require_relative "lib/book_repository.rb"

DatabaseConnection.connect("book_store")
repo = BookRepository.new
repo.all.each do |book|
  p "#{book.id} - #{book.title} - #{book.author_name}"
end
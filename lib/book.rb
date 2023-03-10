class Book
  attr_accessor :id, :title, :author_name

  def initialize(id = nil, title = nil, author_name = nil)
    @id = id ; @title = title ; @author_name = author_name
  end
  
  def ==(other)
    [@id, @title, @author_name] == [
    other.id, other.title, other.author_name]
  end

end
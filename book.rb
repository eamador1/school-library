class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_hash(*)
    {
      title: @title,
      author: @author,
      rentals: @rentals.map { |rental| rental.to_hash(exclude_book: true) }
    }
  end
end

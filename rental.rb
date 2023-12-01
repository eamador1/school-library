class Rental
  attr_reader :date, :book, :person

  def initialize(date, book, person)
    @id = Random.rand(1..10_000)
    @date = date
    @book = book
    @person = person

    person.rentals << self
    book.rentals << self
  end

  def book=(book)
    @book = book
    book.add_rental(self)
  end

  def person=(person)
    @person = person
    person.add_rental(self)
  end

  def to_hash(exclude_book: false)
    {
      date: @date,
      book: exclude_book ? book.title : book.to_hash,
      person: @person.to_hash
    }
  end
end

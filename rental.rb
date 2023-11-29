class Rental
  attr_reader :date, :book, :person

  def initialize(date, book, person)
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

  def to_h
    {
      date: @date,
      book: @book.to_h,
      person: @person.to_h
    }
  end

  def self.from_h(hash)
    book_data = hash['book']
    book = Book.from_h(book_data)

    person_data = hash['person']
    person = Person.from_h(person_data)

    Rental.new(hash['date'], book, person)
  end

  def to_json(*_args)
    {
      date => @date,
      book => @book,
      person => @person
    }.to_json
  end

  def self.from_json(json_data)
    data = JSON.parse(json_data)
    new(data['date'], data['book'], data['person'])
  end
end

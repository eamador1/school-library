class Rental
  attr_accessor :date

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
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission
    }
  end

  def to_json(*_args)
    {
      'date' => @date,
      'book' => @book,
      'person' => @person
    }.to_json
  end

  def self.from_json(json_data)
    data = JSON.parse(json_data)
    new(data['date'], data['book'], data['person'])
  end
end

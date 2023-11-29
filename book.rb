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

  def to_json(*_args)
    {
      title: @title,
      author: @author,
      rentals: @rentals.map(&:to_json)
    }.to_json
  end

  def self.from_json(json_string)
    data = JSON.parse(json_string)
    book = new(data['title'], data['author'])
    data['rentals'].each do |rental_data|
      rental = Rental.from_json(rental_data)
      book.rentals << rental
    end
    book
  end
end

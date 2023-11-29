require_relative 'nameable'
require_relative 'decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'rental'

class Person < Nameable
  def initialize(name, age = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age, :rentals
  attr_reader :id, :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def add_rentals(book, date)
    @rentals << Rental.new(date, book, self)
  end

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end

  def to_json(*_args)
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals.map(&:to_h)
    }.to_json
  end

  def self.from_json(json_data)
    data = JSON.parse(json_data)
    person = new(data['name'], data['age'], parent_permission: data['parent_permission'])
    person.instance_variable_set(:@id, data['id'])

    data['rentals'].each do |rental_data|
      rental = Rental.new(rental_data['date'], rental_data['book'], person)
      person.rentals << rental
    end

    person
  end

  private

  def of_age?
    @age >= 18
  end
end

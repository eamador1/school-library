require_relative 'nameable'
require_relative 'decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'rental'

require 'pry'

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
  attr_reader :id, :classroom, :parent_permission

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

  def to_hash(*)
    {
      json_class: self.class.name,
      id: id,
      name: name,
      age: age,
      parent_permission: parent_permission
    }
  end

  def from_hash(hash); end

  private

  def of_age?
    @age >= 18
  end
end

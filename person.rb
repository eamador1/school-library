require_relative 'nameable'

class Person < Nameable
  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id, :rentals
  attr_accessor :name, :age

  private

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end
end

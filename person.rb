class Person
  def initialize(age, name = "Unknown"  parent_permission = "True")
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id

  attr_accessor :name, :age

  private 
  of_age?
    @age >= 18
  end

  can_use_services?
    @age>=18 || parent_permission = true
  end

end
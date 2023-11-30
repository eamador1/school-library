require_relative 'person'

class Teacher < Person
  attr_writer :id

  def initialize(name, age, specialization, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    super.merge(specialization: @specialization)
  end

  def self.from_hash(hash)
    new(
      hash['name'],
      hash['age'],
      @specialization,
      parent_permission: hash['parent_permission']
    ).tap { |teacher| teacher.id = hash['id'] }
  end
end

require_relative 'person'

class Student < Person
  attr_reader :classroom
  attr_writer :id

  def initialize(name, age, classroom, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
    @classroom.add_student(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_hash(exclude_classroom: false)
    super.merge(classroom: exclude_classroom ? classroom.label : classroom.to_hash)
  end

  def self.from_hash(hash, classroom)
    new(
      hash['name'],
      hash['age'],
      classroom,
      parent_permission: hash['parent_permission']
    ).tap { |student| student.id = hash['id'] }
  end
end

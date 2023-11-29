require_relative 'person'

require 'pry'

class Student < Person
  attr_reader :classroom

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
    # classroom_hash = classroom.to_hash

    # binding.pry
    super.merge(classroom_label: exclude_classroom ? classroom.label : classroom.to_hash)
  end

  def self.from_hash(hash, classroom)
    puts 'hash in student.from_hash', hash.inspect
    puts 'in student.from_hash', hash['name']
    new(
      hash['name'],
      hash['age'],
      classroom,
      parent_permission: hash['parent_permission']
    )
  end
end

class Classroom
  attr_accessor :label, :students

  def initialize(label = 'Unknown', students = [])
    @label = label
    @students = students
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end

  def to_hash
    {
      json_class: self.class.name,
      label: label,
      students: students.map { |student| student.to_hash(exclude_classroom: true) }
    }
  end

  def self.from_hash(hash, students)
    new(hash[:label], students)
  end
end

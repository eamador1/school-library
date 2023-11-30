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
end

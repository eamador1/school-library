require_relative 'spec_helper'

describe 'Student' do
  before :each do
    allow(Random).to receive(:rand).and_return(42)
    @classroom = Classroom.new '1'
    @student = Student.new 'Jane', 12, @classroom
  end

  context '#name' do
    it 'displays the name of the student' do
      student_name = 'Jane'
      expect(@student.name).to eql(student_name)
    end

    it 'updates the name of the student' do
      @student.name = 'Maria'
      student_name = 'Maria'
      expect(@student.name).to eql(student_name)
    end
  end

  context '#age' do
    it 'displays the age of the student' do
      student_age = 12
      expect(@student.age).to eql(student_age)
    end

    it 'updates the age of the student' do
      student_age = 20

      @student.age = 20

      expect(@student.age).to eql(student_age)
    end
  end

  context '#parent_permission' do
    it 'displays the parent permission of the student' do
      expect(@student.parent_permission).to be(true)
    end
  end

  context '#classroom=' do
    let(:classroom) { Classroom.new('1') }

    it 'displays the classroom content' do
      allow(classroom).to receive(:add_student)

      @student.classroom = classroom

      expect(@student.classroom).to eq(classroom)
    end

    it 'updates the classroom property' do
      label = 'Unknown'

      allow(classroom).to receive(:label) { label }
      allow(classroom).to receive(:students) { [@student] }
      allow(classroom).to receive(:add_student) { |student| classroom.students << student }
      @student.classroom = classroom

      expect(@student.classroom.label).to eql(label)
      expect(@student.classroom.students[0]).to eq(@student)
    end
  end

  context '#play_hooky' do
    it "returns the string '¯(ツ)/¯'" do
      expect(@student.play_hooky).to eql('¯(ツ)/¯')
    end
  end

  context '#to_hash and #from_hash' do
    student_hash = { json_class: 'Student',
                     id: 42,
                     name: 'Jane',
                     age: 12,
                     parent_permission: true,
                     classroom: { json_class: 'Classroom', label: '1',
                                  students: [{ json_class: 'Student',
                                               id: 42, name: 'Jane',
                                               age: 12,
                                               parent_permission: true,
                                               classroom: '1' }] } }
    it 'returns the student object converted to hash' do
      expect(@student.to_hash).to eq(student_hash)
    end

    it 'returns the student object reconstructed from a hash' do
      expect(@student.from_hash(student_hash)).to eq(nil)
    end
  end
end

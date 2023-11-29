require 'json'

module CreateInstancesModule
  def create_a_person
    puts 'Do you want to create a student (1) or a Teacher (2)? [Input the number]: '
    person_type = gets.chomp

    # name, age, classroom, parent_permission:


    case person_type
    when '1'
      student = create_a_student
      @people << student
      puts 'Student created succesfully'
    when '2'
      teacher = create_a_teacher
      @people << teacher
      puts 'Teacher created succesfully'
    else
      puts 'Invalid option'
    end
  end

  def create_a_student(classroom = @classroom)
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    # print 'Classroom: '
    # classroom_name = gets.chomp
    # classroom = Classroom.new(classroom_name)

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    student = Student.new(name, age, classroom, parent_permission: parent_permission)

    # ####################################################################
    student_classroom_hash = student.classroom.to_hash
    # puts 'student_classroom_hash', student_classroom_hash
    student_classroom_json = JSON.generate(student_classroom_hash)
    # puts 'student_classroom_json', student_classroom_json
    student_classroom_rehash = JSON.parse(student_classroom_json)
    # puts 'student_classroom_rehash', student_classroom_rehash
    current_classroom = Classroom.from_hash(student_classroom_hash, @classroom.students)
    puts 'classroom from hash', current_classroom.inspect


    student_hash = student.to_hash
    puts 'student_hash', student_hash


    student_json = JSON.generate(student_hash)

    # TODO write to file people.json

    puts 'student_json', student_json
    student_rehash = JSON.parse(student_json, create_additions: true)
    puts 'student_rehash', student_rehash
    # puts 'student_rehash type', student_rehash.class.name
    student_obj = Student.from_hash(student_rehash, @classroom)
    puts "student_obj #{student_obj.inspect} of type #{student_obj.class.name}"
    # ####################################################################

    student
  end

  def create_a_teacher
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Specialization: '
    specialization = gets.chomp

    Teacher.new(name, age, specialization)
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created succesfully'
  end

  def create_a_rental
    puts 'Select a book from the following list by number: '
    @books.each_with_index { |book, index| puts "#{index}) #{book.title}" }

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number: '
    @people.each_with_index { |person, index| puts "#{index}) #{person.name}" }

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created succesfully'
  end
end

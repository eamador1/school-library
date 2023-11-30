require_relative 'display_module'
require_relative 'save_to_file_module'
require 'json'

module CreateInstancesModule
  include DisplayModule
  include SaveToFileModule

  def create_a_person
    puts 'Do you want to create a student (1) or a Teacher (2)? [Input the number]: '
    person_type = gets.chomp

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
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    Student.new(name, age, classroom, parent_permission: parent_permission)
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
    puts 'Select a book from the following list by number:'

    file_book_json = list_all_books

    puts 'Select a book from the following list by number:'
    book_index = gets.chomp.to_i
    book_data = file_book_json[book_index]
    select_book = Book.new(
      book_data['title'],
      book_data['author']
    )

    puts 'Select a person from the following list by number (not id):'

    file_people_json = list_all_people

    puts 'Select a person from the following list by number (not id):'

    person_index = gets.chomp.to_i
    person_data = file_people_json[person_index]
    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, select_book, person_data)
  end
end

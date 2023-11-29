require_relative 'display_module'
require 'json'

module CreateInstancesModule
  include DisplayModule
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

  def create_a_student
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Classroom: '
    classroom_name = gets.chomp
    classroom = Classroom.new(classroom_name)

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
    file_book_json = list_all_books
    book_index = gets.chomp.to_i
    book_data = file_book_json[book_index]
    puts selected_book = Book.new(book_data['title'], book_data['author']).to_json

    file_people_json = list_all_people
    person_index = gets.chomp.to_i
    person_data = file_people_json[person_index]
    puts selected_person = Person.new(
      person_data['name'],
      person_data['age']
      # person_data['parent_permission']
    ).to_json
    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, selected_book, selected_person)
    save_rental(rental)
    rental
  end

  def save_rental(rental)
    FileHandler.load_or_create('rentals.json')
    rentals_obj = { date: rental.date, title: rental.book.title, author: rental.book.author,
                    person_id: rental.person.id }
    FileHandler.save('rentals.json', rentals_obj)
    puts 'Rental saved successfully.'
  end
end

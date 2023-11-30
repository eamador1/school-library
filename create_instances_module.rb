require  'json'

module CreateInstancesModule
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
    save_people_to_file
  end

  def save_people_to_file
    stored_people = []
    if File.exist?('people.json')
      people_in_file = File.read('people.json')
      stored_people = JSON.parse(people_in_file) unless people_in_file.empty?
    end

    new_people = @people.map(&:to_hash)
    new_people.each do |new_person|
      existing_person = stored_people.find { |p| p['id'] == new_person['id'] }
      if existing_person
        existing_person.merge!(new_person)
      else
        stored_people << new_person
      end
    end
    people_json = JSON.pretty_generate(stored_people)
    File.write('people.json', people_json)
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

    save_books_to_json
  end

  def save_books_to_json
    stored_books = []

    if File.exist?('books.json')
      existing_books_json = File.read('books.json')
      stored_books = JSON.parse(existing_books_json) unless existing_books_json.empty?
    end

    new_books = @books.map do |book|
      { title: book.title, author: book.author }
    end

    new_books.each do |new_book|
      existing_book = stored_books.find { |b| b['title'] == new_book['title'] }
      if existing_book
        existing_book.merge!(new_book)
      else
        stored_books << new_book
      end
    end

    json_data = JSON.pretty_generate(stored_books)

    File.write('books.json', json_data)
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

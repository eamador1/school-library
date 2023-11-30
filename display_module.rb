module DisplayModule
  def list_all_books
    stored_books = load_books_from_json

    if stored_books.empty?
      puts 'No books found in the file.'
    else
      stored_books.each_with_index do |book, index|
        puts "#{index}) Title: \"#{book['title']}\", Author: #{book['author']}"
      end
    end
  end

  def load_books_from_json
    stored_books = []

    if File.exist?('books.json')
      existing_books_json = File.read('books.json')
      stored_books = JSON.parse(existing_books_json) unless existing_books_json.empty?
    end

    stored_books
  end

  def list_all_people
    if File.exist?('people.json')
      people_json = File.read('people.json')
      if people_json.empty?
        puts 'The list is empty'
      else
        people_hash = JSON.parse(people_json)
        @people = people_hash.map do |person|
          if person['json_class'] == 'Student'
            Student.from_hash(person, @classroom)
          else
            Teacher.from_hash(person)
          end
        end
      end
    end

    @people.each_with_index do |person, index|
      puts "#{index}) #{person.class}: Name: #{person.name}, Id: #{person.id}, Age: #{person.age}"
    end
  end

  def list_all_rentals_for_given_person_id
    print 'Enter person id: '
    person_id = gets.chomp.to_i

    rentals = @rentals.select { |rental| rental.person.id == person_id }

    if rentals.empty?
      puts 'No rentals found for the given person id.'
    else
      puts 'Rentals: '
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end
end

module DisplayModule
  def list_all_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
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

    @people.each { |person| puts "#{person.class}: Name: #{person.name}, Id: #{person.id}, Age: #{person.age}" }
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

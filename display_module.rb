module DisplayModule
  def list_all_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_people
    # saca del archivo
    # create objects from file
    # puts 'student_json', student_json
    # student_rehash = JSON.parse(student_json, create_additions: true)
    # puts 'student_rehash', student_rehash
    # # puts 'student_rehash type', student_rehash.class.name
    # student_obj = Student.from_hash(student_rehash, @classroom)
    # puts "student_obj \#{student_obj.inspect} of type \#{student_obj.class.name}"

    # acutaliza array
    # display information from array
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

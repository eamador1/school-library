module DisplayModule
  def list_all_books
    puts 'Select a book from the following list by number: '
    file_book_json = File.open('books.json', 'r') { |file| JSON.parse(file.read) }
    file_book_json.each_with_index do |book, index|
      puts "#{index}) Title: '#{book['title']}', Author: #{book['author']}"
    end
  end

  def list_all_people
    puts 'Select a person from the following list by number: '
    file_people_json = File.open('people.json', 'r') { |file| JSON.parse(file.read) }
    file_people_json.each_with_index do |person, index|
      puts "#{index}) [#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
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

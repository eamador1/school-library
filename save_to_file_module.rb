module SaveToFileModule
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
    stored_people
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
    stored_books
  end

  def save_rentals_to_file
    stored_rentals = []
    if File.exist?('rentals.json')
      rentals_in_file = File.read('rentals.json')
      stored_rentals = JSON.parse(rentals_in_file) unless rentals_in_file.empty?
    end

    new_rental = @rentals.map(&:to_hash)
    new_rental.each do |rental|
      existing_rental = stored_rentals.find { |rent| rent['id'] == rental['id'] }
      if existing_rental
        existing_rental.merge!(rental)
      else
        stored_rentals << rental
      end
    end
    stored_rentals
  end
end

module SaveToFileModule
  def save_people_to_file
    stored_people = []
    if File.exist?('people.json')
      people_in_file = File.read('people.json')
      stored_people = JSON.parse(people_in_file) unless people_in_file.empty?
    end

    new_people = @people.map(&:to_hash)
    new_people.each do |new_person|
      stored_people << new_person
    end
    people_json = JSON.pretty_generate(stored_people)
    File.write('people.json', people_json)
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
      stored_books << new_book
    end
    json_data = JSON.pretty_generate(stored_books)
    File.write('books.json', json_data)
  end

  def save_rentals_to_file
    stored_rentals = []
    if File.exist?('rentals.json')
      rentals_in_file = File.read('rentals.json')
      stored_rentals = JSON.parse(rentals_in_file) unless rentals_in_file.empty?
    end

    new_rental = @rentals.map(&:to_hash)
    new_rental.each do |rental|
      stored_rentals << rental
    end
    rentals_json = JSON.pretty_generate(stored_rentals)
    File.write('rentals.json', rentals_json)
  end
end

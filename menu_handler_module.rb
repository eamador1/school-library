require_relative 'save_to_file_module'

module MenuHandlerModule
  include SaveToFileModule

  CHOICES = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_a_person,
    4 => :create_a_book,
    5 => :create_a_rental,
    6 => :list_all_rentals_for_given_person_id,
    7 => :exit_app
  }.freeze

  def display_menu
    puts 'Please choose an option by entering a number: '
    CHOICES.each { |key, value| puts "#{key} - #{value.to_s.tr('_', ' ')}" }
    gets.chomp.to_i
  end

  def handle_option(app, option)
    choice = CHOICES[option]
    if choice
      app.send(choice)
    else
      puts 'Invalid option. Please choose a valid option'
    end
  end

  def exit_app
    puts 'Exiting the program'
    write_to_files
    exit
  end

  def write_to_people(stored_people)
    people_json = JSON.pretty_generate(stored_people)
    File.write('people.json', people_json)
  end

  def write_to_books(stored_books)
    json_data = JSON.pretty_generate(stored_books)
    File.write('books.json', json_data)
  end

  def write_to_rentals(stored_rentals)
    rentals_json = JSON.pretty_generate(stored_rentals)
    File.write('rentals.json', rentals_json)
  end

  def write_to_files
    books_to_array = save_books_to_json
    #write_to_people
    write_to_books(books_to_array)
    #write_to_rentals
  end
end

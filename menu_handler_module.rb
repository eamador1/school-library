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

  def write_to_files
    save_people_to_file
    save_books_to_json
    save_rentals_to_file
  end
end

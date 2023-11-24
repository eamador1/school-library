require_relative 'app'

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

def main
  app = App.new

  loop do
    option = display_menu
    handle_option(app, option)
  end
end

main

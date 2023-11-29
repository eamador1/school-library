require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'
require_relative 'display_module'
require_relative 'create_instances_module'
require_relative 'menu_handler_module'
require_relative 'file_handler'

class App
  include DisplayModule
  include CreateInstancesModule
  include MenuHandlerModule
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = FileHandler.load_or_create('rentals.json')
  end
end

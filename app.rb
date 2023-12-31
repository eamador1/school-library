require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'
require_relative 'display_module'
require_relative 'create_instances_module'
require_relative 'menu_handler_module'

class App
  include DisplayModule
  include CreateInstancesModule
  include MenuHandlerModule
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    @classroom = Classroom.new('1')
  end
end

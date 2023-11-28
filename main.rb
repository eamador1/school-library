require_relative 'app'
require_relative 'menu_handler_module'

class Main
  include MenuHandlerModule
  def run
    app = App.new

    loop do
      option = display_menu
      handle_option(app, option)
    end
  end
end

main = Main.new
main.run

require_relative 'decorator'

class CapitalizeDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

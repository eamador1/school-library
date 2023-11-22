require_relative Decorator

class CapitalizeDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

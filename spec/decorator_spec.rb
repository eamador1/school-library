require_relative 'spec_helper'

describe 'Decorator' do
  before :each do
    @person = Person.new 'Julianne', 20
    @decorator = Decorator.new @person
  end

  it 'returns the name without changes' do
    expect(@decorator.correct_name).to eql(@person.name)
  end
end

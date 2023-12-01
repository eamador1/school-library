require_relative 'spec_helper'

describe 'Person' do
  before :each do
    @person = Person.new 'John', 15
  end

  context '#name' do
    it 'displays the name of the person' do
      expect(@person.name).to eql('John')
    end

    it 'updates the name of the person' do
      @person.name = 'Jane'
      expect(@person.name).to eql('Jane')
    end
  end

  context '#age' do
    it 'displays the age of the person' do
      expect(@person.age).to eql(15)
    end

    it 'updates the age of the person' do
      @person.age = 20
      expect(@person.age).to eql(20)
    end
  end
end

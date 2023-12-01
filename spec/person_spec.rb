require_relative 'spec_helper'
require 'pry'

describe 'Person' do
  before :each do
    allow(Random).to receive(:rand).and_return(42)
    @person = Person.new 'John', 15
  end

  context '#name' do
    it 'displays the name of the person' do
      person_name = 'John'
      expect(@person.name).to eql(person_name)
    end

    it 'updates the name of the person' do
      @person.name = 'Jane'
      person_name = 'Jane'
      expect(@person.name).to eql(person_name)
    end
  end

  context '#age' do
    it 'displays the age of the person' do
      person_age = 15
      expect(@person.age).to eql(person_age)
    end

    it 'updates the age of the person' do
      person_age = 20

      @person.age = 20

      expect(@person.age).to eql(person_age)
    end
  end

  context '#correct_name' do
    it 'returns the name of the person' do
      person_correct_name = 'John'
      expect(@person.correct_name).to eql(person_correct_name)
    end
  end

  context '#rentals' do
    it 'displays the list of rentals' do
      expect(@person.rentals).to be_an(Array)
    end

    it 'add a a new rental object to the rental list' do
      person_id = 42
      title = "The HitchHicker's Guide to the Galaxy"
      author = 'Douglas Adams'
      book = double('Book')
      date = '2023/11/30'
      rentals = [{ title: title, author: author, rentals: book }]

      allow(book).to receive(:title) { title }
      allow(book).to receive(:author) { author }
      allow(book).to receive(:rentals) { rentals }
      @person.add_rentals(book, date)

      expect(@person.rentals[0].person.id).to eql(person_id)
      expect(@person.rentals[0].book.title).to eql(title)
    end
  end

  context '#classroom=' do
    let(:classroom) { Classroom.new('1') }

    it 'displays the classroom content' do
      allow(classroom).to receive(:add_student)

      @person.classroom = classroom

      expect(@person.classroom).to eq(classroom)
    end


    it 'updates the classroom property' do
      label = 'Unknown'

      allow(classroom).to receive(:label) { label }
      allow(classroom).to receive(:students) { [@person] }
      allow(classroom).to receive(:add_student) { |student| classroom.students << student }
      @person.classroom = classroom

      expect(@person.classroom.label).to eql(label)
      expect(@person.classroom.students[0]).to eq(@person)
    end
  end

  context '#can_use_services' do
    it 'returns true when the age is >= 18' do
      is_adult = true

      @person.age = 20

      expect(@person.can_use_services?).to be(is_adult)
    end
  end

  context '#to_hash and #from_hash' do
    it 'returns the person object converted to hash' do
      person_hash = { json_class: 'Person', id: 42, name: 'John', age: 15, parent_permission: true }

      expect(@person.to_hash).to eq(person_hash)
    end

    it 'returns the person object reconstructed from a hash' do
      person_hash = { json_class: 'Person', id: 42, name: 'John', age: 15, parent_permission: true }

      expect(@person.from_hash(person_hash)).to eq(nil)
    end
  end
end

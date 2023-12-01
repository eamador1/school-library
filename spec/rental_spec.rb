require_relative 'spec_helper'
require 'pry'

describe 'Rental' do
  before do
    allow(Random).to receive(:rand).and_return(42)
    @book = Book.new('1984', 'George Orwell')
    @person = Person.new('John Doe', 30)
  end

  describe '#initialize' do
    it 'creates a rental with a date, book, and person' do
      rental = Rental.new('2023-09-05', @book, @person)

      expect(rental.date).to eq('2023-09-05')
      expect(rental.book).to eq(@book)
      expect(rental.person).to eq(@person)
    end

    it 'adds the rental to the book and person' do
      rental = Rental.new('2023-09-05', @book, @person)

      expect(@book.rentals).to include(rental)
      expect(@person.rentals).to include(rental)
    end

    it 'raises an error if book is missing' do
      expect { Rental.new('2023-09-05', @person) }.to raise_error(ArgumentError)
    end
    it 'raises an error if person is missing' do
      expect { Rental.new('2023-09-05', @book) }.to raise_error(ArgumentError)
    end
    it 'raises an error if date is missing' do
      expect { Rental.new(@book, @person) }.to raise_error(ArgumentError)
    end
  end

  describe '#to_hash and from_hash' do
    it 'returns a hash representation of the rental' do
      rental = Rental.new('2023-09-05', @book, @person)
      rental_hash = { date: '2023-09-05',
                      book: { title: '1984',
                              author: 'George Orwell',
                              rentals: [{ date: '2023-09-05', book: '1984',
                                          person: {
                                            json_class: 'Person', id: 42,
                                            name: 'John Doe',
                                            age: 30,
                                            parent_permission: true
                                          } }] },
                      person: { json_class: 'Person', id: 42, name: 'John Doe', age: 30,
                                parent_permission: true } }
      expect(rental.to_hash).to eq(
        rental_hash
      )
    end

    it 'receive a hash representation of the rental' do
      binding.pry
      rental = Rental.new('2023-09-05', @book, @person)
      rental_hash = { date: '2023-09-05',
                      book: { title: '1984',
                              author: 'George Orwell',
                              rentals: [{ date: '2023-09-05', book: '1984',
                                          person: {
                                            json_class: 'Person', id: 42,
                                            name: 'John Doe',
                                            age: 30,
                                            parent_permission: true
                                          } }] },
                      person: { json_class: 'Person', id: 42, name: 'John Doe', age: 30,
                                parent_permission: true } }
      expect(rental.from_h).to eq(
        rental_hash
      )
    end
  end
end

require_relative 'spec_helper'

RSpec.describe Rental do
  let(:book_title) { 'The Great Gatsby' }
  let(:author_name) { 'F. Scott Fitzgerald' }
  let(:person_name) { 'John Doe' }
  let(:rental_date) { '2023-01-01' }

  let(:book) { Book.new(book_title, author_name) }
  let(:person) { Person.new(person_name) }

  subject(:rental) { described_class.new(rental_date, book, person) }

  describe '#initialize' do
    it 'creates a rental with the specified date, associated book, and person' do
      expect(rental.date).to eq(rental_date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)

      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#book=' do
    it 'updates the book association and adds the rental to the new book' do
      new_book = Book.new('New Book', 'New Author')
      rental.book = new_book

      expect(rental.book).to eq(new_book)
      expect(new_book.rentals).to include(rental)
      expect(book.rentals).not_to include(rental)
    end
  end

  describe '#person=' do
    it 'updates the person association and adds the rental to the new person' do
      new_person = Person.new('New Person')
      rental.person = new_person

      expect(rental.person).to eq(new_person)
      expect(new_person.rentals).to include(rental)
      expect(person.rentals).not_to include(rental)
    end
  end
end

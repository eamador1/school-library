require_relative 'spec_helper'

describe 'book' do
  before(:each) do
    @book = Book.new('Azul', 'Ruben Dario')
  end

  context '#title' do
    it 'displays the title of the book' do
      expect(@book.title).to eql('Azul')
    end

    it 'updates the title of the book' do
      @book.title = 'Cantos de vida y ...'
      expect(@book.title).to eql('Cantos de vida y ...')
    end
  end

  context '#author' do
    it "displays the author's name" do
      expect(@book.author).to eql('Ruben Dario')
    end
    it "updates the author's name" do
      @book.author = 'Octavio Paz'
      expect(@book.author).to eql('Octavio Paz')
    end
  end
end

# test/models/book_test.rb
require "test_helper"

describe Book do
  describe "validations" do
    it "Can be created with all attributes" do
      a = Author.create!(name: "test author")
      Book.create!(title: 'test title', author: a)
      # result = book.valid?
      # result.must_equal true
    end

    it "Requires a title" do
      book = Book.new
      result = book.valid?
      result.must_equal false

      # Check that the validation we're testing
      # did actually fail
      book.errors.messages.must_include :title
    end

    it "Must have a unique title" do
      a = Author.create!(name: "test author")

      # Add a book to the DB to be a duplicate with
      book1 = Book.create!(title: "duplicate title", author: a)

      # Create the duplicate book
      book2 = Book.new(title: "duplicate title", author: a)

      result = book2.valid?
      result.must_equal false

      book2.errors.messages.must_include :title
    end
  end

  describe 'relations' do
    it 'can set the author through "author"' do
      book = Book.new(title: "test book")

      # Make the models relate to one another
      book.author = Author.find_by(name: "Sandi Metz")

      # author_id should have changed accordingly
      book.author_id.must_equal authors(:metz).id
    end

    it 'can set the author through "author_id"' do
      # Create two models
      book = Book.new(title: "test book")

      # Make the models relate to one another
      book.author_id = authors(:metz).id

      # author should have changed accordingly
      book.author.must_equal authors(:metz)
    end
  end
end

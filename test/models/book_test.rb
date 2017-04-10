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
  end
end

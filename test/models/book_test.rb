# test/models/book_test.rb
require "test_helper"

describe Book do
  let(:book) { Book.new }

  it "must be valid" do
    value(album).must_be :valid?
  end
end

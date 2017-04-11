require 'test_helper'

describe BooksController do
  describe "index" do
    it "Responds successfully" do
      Book.count.must_be :>, 0
      get books_path
      must_respond_with :success
    end

    it "still responds successfully when there are no books" do
      Book.destroy_all
      get books_path
      must_respond_with :success
    end

  end

  describe "new" do
  end

  describe "create" do
    it "adds a book to the database" do
      book_data = {
        book: {
          title: "test book",
          author_id: Author.first.id
        }
      }
      post books_path, params: book_data
      must_redirect_to books_path
    end

    it "re-renders the new book form if the book is invalid" do
      book_data = { book: { title: "test book"} }
      post books_path, params: book_data
      must_respond_with :bad_request
    end
  end

  describe "show" do
    it "shows a book that exists" do
      book = Book.first
      get book_path(book)
      must_respond_with :success
    end

    it "return a 404 if the book doesn't exist" do
      book_id = Book.last.id
      book_id += 1
      get book_path(book_id)

      must_respond_with :not_found
    end
  end
end

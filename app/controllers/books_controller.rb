class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def create
    puts ">>>> DPR: In BooksController#create"

    book_data = book_params
    puts book_data.to_hash
    Book.create(book_data)
  end

  def show
    id = params[:id].to_i
    @book = Book.find(id)
  end

private
  def book_params
    return params.require(:book).permit(:author, :title, :synopsis, :publication_year, :publication_city)
  end
end

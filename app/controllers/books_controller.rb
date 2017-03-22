class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def create
    Book.create(book_params)

    redirect_to books_path
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

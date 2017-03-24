class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)

    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update_attributes(book_params)
    book.save

    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    redirect_to books_path

    # Another valid but perhaps less clean option for reloading the list of books
    # @books = Book.all
    # render :index
  end

private
  def book_params
    return params.require(:book).permit(:author, :title, :synopsis, :publication_year, :publication_city)
  end
end

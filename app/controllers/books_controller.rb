class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to books_path
    else
      # We know the validations didn't pass
      render :new
    end
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

  def mark_read
    puts ">>> DPR: Marking a book as read!"
  end

private
  def book_params
    return params.require(:book).permit(:author, :title, :synopsis, :publication_year, :publication_city)
  end
end

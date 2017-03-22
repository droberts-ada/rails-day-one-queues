class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def show
    id = params[:id].to_i
    @book = Book.find(id)
  end
end

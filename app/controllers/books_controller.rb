class BooksController < ApplicationController
  def index
    @books = [{ title: "Hidden Figures", author: "Margot Lee Shetterly"},
              { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
              { title: "Kindred", author: "Octavia E. Butler"}]
  end
end

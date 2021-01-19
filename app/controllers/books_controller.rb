class BooksController < ApplicationController
  def index
  	@model = Book.all
  end

  def show
  	load_model
  end

  def new
  	@model = Book.new
  end

  def create
  	@model = Book.new(book_params)
  end

  def destroy
  end

  private

  def book_params
  	params.require(:book).permit(:title, :published_year)
  end

  def load_author
  	@author = Author.find(params[:id])
  end

  def load_book
  	@model = Book.find(params[:id])
  end

end

class BooksController < ApplicationController
  def index
  	@model = Book.all
  end

  def show
  	load_model
  end

  def edit
  	load_model
  	load_author
  end

  def new
  	@model = Book.new
  end

  def create
  	@model = Book.new(book_params)
  end

  private

  def book_params
  	params.require(:book).permit(:title, :published_year, author_attributes:[:name, :birth_year])
  end

  def load_author
  	@author = Author.find(params[:id])
  end

  def load_model
  	@model = Book.find(params[:id])
  end

end

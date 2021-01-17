class BookController < ApplicationController
  def index
  	@model = Book.all
  end

  def show
  end
end

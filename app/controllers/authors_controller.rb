class AuthorsController < ApplicationController
  def index
  	@model = Author.all
  end

  def show
  end

  def new
  	@model = Author.new
  	@model.books.build
  end

  def create
  	@model = Author.new(author_params)
  	if @model.save
  		redirect_to books_path
  	end
  end

  def destroy
  end


  private

  def author_params
  	params.require(:author).permit(:name, :birth_year, books_attributes: [:title, :published_year])
  end

end

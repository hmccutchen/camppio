class AuthorsController < ApplicationController
  def index
  	@model = Author.all
  end

  def show
  	load_model
  	load_book
  end

  def new
  	@model = Author.new
  	@model.books.build
  end

  def edit
  	load_model 
  	 @model.books.each do |book|
  	 	@book = book
  	 end

  end

  def update
  	load_model
   
  @model.update_attributes(author_params)
  if @model.save
  	redirect_to books_path
  end
  end

  def create
  	@model = Author.new(author_params)
  	if @model.save
  		redirect_to books_path
  	end
  end

  def destroy
  	load_model
  	@model.destroy
  	if @model.destroy
  		redirect_to new_author_path
  	end
  end


  private

  def author_params
  	params.require(:author).permit(:id, :name, :birth_year, books_attributes: [:id, :title, :published_year])
  end

  def load_model
  	@model = Author.find(params[:id])
  end

  def load_book
  	@book = Book.find(params[:id])
  end
end

class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def create

  end

  def new
    @book = Book.new
    @authors = Author.all
  end

  def edit
    @book = Book.find(params[:id])
    @authors = Author.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def update

  end

  def destroy

  end


end

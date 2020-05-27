class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def create
    author = Author.new(authors_params)
    begin
      author.save!
      redirect_to authors_path
    rescue
      redirect_to root_path
    end
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def show
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    begin
      author.update!(authors_params)
      redirect_to new_author_path
    rescue => err
      puts err
      redirect_to root_path
    end
  end

  def destroy
    author = Author.find(params[:id])
    begin
      author.destroy!
      redirect_to authors_path
        # rescue Type => err
    rescue
      redirect_to root_path
    end
  end

  private
  def authors_params
    params.require('author').permit(:name, :year, :email)
  end

end

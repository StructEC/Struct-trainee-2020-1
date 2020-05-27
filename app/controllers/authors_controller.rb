class AuthorsController < ApplicationController
  include AuthorsHelper

  def index
    puts cookies.encrypted[:test]
    @authors = Author.all
  end

  def create
    author = Author.new(authors_params)
    begin
      author.save!
      flash[:notice] = "Autor #{author.name} criado com sucesso"
      redirect_to authors_path
    rescue => err
      flash[:notice] = err
      redirect_to new_author_path
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
      flash[:notice] = "Autor #{author.name} alterado com sucesso"
      redirect_to authors_path
    rescue => err
      flash[:notice] = err
      redirect_to edit_author_path
    end
  end

  def destroy
    author = Author.find(params[:id])
    begin
      author.destroy!
      flash[:notice] = "Autor #{author.name} apagado com sucesso"
        # rescue Type => err
    rescue
      flash[:notice] = "Ocorreu um erro"
    ensure
      redirect_to authors_path
    end
  end

  private
  def authors_params
    params.require('author').permit(:name, :year, :email)
  end

end

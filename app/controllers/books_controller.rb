class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    begin
      book.save!
      flash[:notice] = "Livro #{book.name} salvo com sucesso"
      redirect_to books_path
    rescue
      flash[:notice] = "Ocorreu um erro"
      redirect_to root_path
    end
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
    book = Book.find(params[:id])
    begin
      book.update!(book_params)
      flash[:notice] = "Livro #{book.name} alterado com sucesso"
      redirect_to books_path
    rescue => err
      puts err
      flash[:notice] = "Ocorreu um erro"
      redirect_to root_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    begin
      book.destroy!
      flash[:notice] = "Livro #{@book.name} deletado com sucesso"
      redirect_to books_path
      # rescue Type => err
    rescue
      flash[:notice] = "Ocorreu um erro"
      redirect_to root_path
    end
  end

  private
  def book_params
    params.require('book').permit(:name, :num_pages, :content, :author_id)
  end

end

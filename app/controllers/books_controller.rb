class BooksController < ApplicationController

  def index
    puts session[:test]
    @books = Book.all
    # response.status = 500
  end

  def create
    book = Book.new(book_params)
    begin
      book.save!
      flash[:notice] = "Livro #{book.name} salvo com sucesso"
      redirect_to books_path
    rescue => err
      flash[:notice] = err
      redirect_to new_book_path
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
      flash[:notice] = err
      redirect_to edit_book_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    begin
      book.destroy!
      flash[:notice] = "Livro #{book.name} deletado com sucesso"
      # rescue Type => err
    rescue
      flash[:notice] = "Ocorreu um erro"
    ensure
      redirect_to books_path
    end
  end

  private
  def book_params
    params.require('book').permit(:name, :num_pages, :content, :author_id)
  end

end

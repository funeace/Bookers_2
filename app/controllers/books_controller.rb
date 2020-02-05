class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.all
  end

  def create
    book = current_user.books.new(book_params)
    book.save
    redirect_to user_path(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    # 子から親を参照している
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end

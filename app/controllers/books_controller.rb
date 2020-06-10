class BooksController < ApplicationController
  before_action :authenticate_user!, :current_user_info, :new_book

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def current_user_info
    @user = User.find(current_user.id)
  end

  def new_book
    @new_book = Book.new
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

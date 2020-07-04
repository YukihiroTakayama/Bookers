# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_book_user, only: [:edit]

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@new_book.id)
    else
      @books = Book.all
      render action: :index
    end
  end

  def index
    @new_book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    return render action: :edit unless @book.update(book_params)

    flash[:notice] = 'You have updated book successfully.'
    redirect_to book_path(@book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def correct_book_user
    book_user_id = Book.find(params[:id]).user.id
    redirect_to books_path if current_user.id != book_user_id
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

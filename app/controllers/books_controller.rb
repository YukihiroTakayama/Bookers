class BooksController < ApplicationController
  before_action :authenticate_user!, :current_user_info

  def create
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
end

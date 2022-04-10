class BooksController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to book_path(@book)
    else
      render :index
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

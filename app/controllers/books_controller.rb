class BooksController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def create
    @user = User.find(current_user.id)
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all

    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      render :index
    end
  end

  def show
    @book = Book.new
    @detail = Book.find(params[:id])
    @user = @detail.user
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

class BooksController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @books = Book.where(is_public: true)
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to books_path, success: t("books.create.success")
    else
      flash.now[:danger] = t("books.create.failure")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :outline_title, :outline_body, :is_public)
  end
end

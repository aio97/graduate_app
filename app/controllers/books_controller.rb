class BooksController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @books = Book.where(is_public: true)
  end

  def new
    @book = Book.new
    @book.plans.build
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to book_path(@book), success: t("books.create.success")
    else
      flash.now[:danger] = t("books.create.failure")
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
    @plan = Plan.find_by(book_id: params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :outline_title, :outline_body, :is_public, 
                                  plans_attributes: [
                                    :date, :title, :start_time, :end_time, :icon, :location, :location_url, :detail, :memo, :cost, :cost_display_per, :cost_display_total, :_destroy 
                                  ])
  end
end

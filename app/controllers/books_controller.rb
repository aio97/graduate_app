class BooksController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @books = Book.where(is_public: true).page(params[:page]).per(15)
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    logger.debug(@book.plans)
    if @book.save
      redirect_to book_path(@book), success: t("books.create.success")
    else
      flash.now[:danger] = t("books.create.failure")
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
    @plans = Plan.find_by(book_id: params[:id])
  end

  def edit
    @book = current_user.books.find(params[:id])
  end

  def update
    @book = current_user.books.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), success: t("books.update.success")
    else
      flash.now[:danger] = t("books.update.failure")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    book = current_user.books.find(params[:id])
    book.destroy!
    redirect_to books_path, success: t("books.destroy.success"), status: :see_other
  end

  def created_index
    @books = Book.where(user_id: current_user.id).page(params[:page]).per(15)
  end

  private

  def book_params
    params.require(:book).permit(
      :title, :outline_title, :outline_body, :is_public,
      plans_attributes: [ :id, :date, :title, :start_time, :end_time, :icon, :location, :location_url, :detail, :memo, :cost, :cost_display_per, :cost_display_total, :_destroy ]
      )
  end
end

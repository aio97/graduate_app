class PlansController < ApplicationController
  before_action :set_book

  def destroy
    @plan = @book.plans.find(params[:id])
    @plan.destroy
    redirect_to edit_book_path(@book)
  end

  private

  def set_book
    @book = current_user.books.find(params[:book_id])
  end
end

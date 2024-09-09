class PlansController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @plan = @book.plans.build
  end
end

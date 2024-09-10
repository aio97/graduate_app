class PlansController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @plan = @book.plans.build
  end

  def create
    @book = Book.find(params[:book_id])
    @plan = @book.plans.build(plan_params)
    if @plan.save
      redirect_to @book
    else
      render :new
    end
  end
  end
  
  private
  
  def plan_params
    params.require(:plan).permit(:date, :title, :start_time, :end_time, :icon, :location, :location_url, :detail, :memo, :cost, :cost_display_per, :cost_display_total)
  end
end

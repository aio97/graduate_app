class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top
    @books = Book.where(is_public: true).order(created_at: :asc).limit(6)

    if logged_in?
      redirect_to books_path
    end
  end
end

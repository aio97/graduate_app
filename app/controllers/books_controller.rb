class BooksController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @books = Book.where(is_public: true)
  end
end

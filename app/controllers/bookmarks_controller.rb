class BookmarksController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    current_user.bookmark(book)
    redirect_to books_path
  end

  def destroy
    book = current_user.bookmarks.find(params[:id]).book
    current_user.unbookmark(book)
    redirect_to books_path
  end
end

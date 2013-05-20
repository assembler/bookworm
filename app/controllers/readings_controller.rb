class ReadingsController < ApplicationController
  before_filter :authenticate_user!, :load_book

  def create
    Reading.create! book_id: @book.id, user_id: current_user.id
    redirect_to book_path(@book)
  end

private
  def load_book
    @book = Book.find params[:book_id]
  end
end

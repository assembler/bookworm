class ReadingsController < ApplicationController
  before_filter :authenticate_user!, :load_book

  def create
    Reading.create! book_id: @book.id, user_id: current_user.id
    redirect_to book_path(@book)
  end

  def update
    reading = Reading.find params[:id]
    reading.rating = params[:reading][:rating]
    reading.save!
    redirect_to book_path(@book), notice: "Thank you for rating!"
  end

private
  def load_book
    @book = Book.find params[:book_id]
  end
end

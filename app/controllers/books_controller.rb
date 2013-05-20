class BooksController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def index
    @books = Book.page(params[:page]).per(30)
    @books = @books.includes(:readings)
    @books = @books.where(isbn: params[:isbn]) if params[:isbn].present?
  end

  def new
    @book = Book.new
    @book.isbn = params[:isbn]
  end

  def create
    @book = Book.new(book_params)
    @book.save!
    redirect_to @book
  rescue ActiveRecord::RecordInvalid
    render :new
  end

  def show
    @book = Book.find params[:id]
    @readings = @book.readings
    @rating = RatingCalculator.new(@readings.map(&:rating)).call
    @reader = Reader.new(current_user)
  end

private
  def book_params
    params.require(:book).permit(:isbn, :title)
  end
end

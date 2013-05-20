class Reader
  def initialize(user)
    @user = user
  end

  def read?(book)
    @user && Reading.where(user_id: @user, book_id: book).exists?
  end
end

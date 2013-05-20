class Reader
  def initialize(user, reading_finder=Reading.public_method(:get))
    @user = user
    @reading_finder = reading_finder
  end

  def reading_of(book)
    if @user.guest?
      nil
    else
      @reading_finder.(book, @user)
    end
  end

  def read?(book)
    !!reading_of(book)
  end
end

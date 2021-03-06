class RatingPolicy
  def initialize(reading, user)
    @reading = reading
    @user = user
  end

  def can_rate?
    @user.admin? || (!@user.guest? && @reading.user == @user && !@reading.rated?)
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    user = super

    if user
      user.extend AuthenticatedUser
    else
      GuestUser.new
    end
  end

  def user_signed_in?
    !current_user.guest?
  end
end

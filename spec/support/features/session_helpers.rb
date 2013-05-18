module Features
  module SessionHelpers
    include Warden::Test::Helpers

    def sign_in(user)
      login_as user, scope: :user
      @current_user = user
    end

    attr_reader :current_user
  end
end

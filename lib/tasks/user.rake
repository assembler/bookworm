namespace :user do

  task create_admin: :environment do
    print "E-mail address: "
    email = STDIN.gets.strip

    print "Password: "
    password = STDIN.gets.strip

    user = User.new email: email,
                    password: password,
                    password_confirmation: password,
                    admin: true
    user.save!
    puts "-> (done)"
  end

end

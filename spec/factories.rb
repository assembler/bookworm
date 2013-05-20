FactoryGirl.define do
  sequence(:email) { |n| Faker::Internet::email }
  sequence(:isbn) { |n| "%08d-%03d" % [rand(10**8), n] }

  factory :user do
    email
    password 'passwd'
    password_confirmation 'passwd'
  end

  factory :book do
    isbn
    title { Faker::Lorem.sentence }
  end

  factory :reading do
    user
    book
  end
end

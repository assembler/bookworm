FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@email.com" }

  factory :user do
    email
    password 'passwd'
    password_confirmation 'passwd'
  end
end

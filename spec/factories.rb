FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@email.com" }
  sequence(:isbn) { |n| "%08d-%03d" % [rand(10**8), n] }

  factory :user do
    email
    password 'passwd'
    password_confirmation 'passwd'
  end

  factory :book do
    isbn
    sequence(:title) { |n| "Book #{n}"}
  end

  factory :reading do
    user
    book
  end
end

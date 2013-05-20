require 'factory_girl_rails'

namespace :fakeout do
  task clean: :environment do
    Fakeout.clean
  end

  task small: :clean do
    Fakeout.new(0.2).run
  end

  task medium: :clean do
    Fakeout.new(1.0).run
  end

  task large: :clean do
    Fakeout.new(5.0).run
  end
end

class Fakeout
  def initialize(size_factor)
    @size_factor = size_factor
  end

  def run
    puts "Running fakeout..."
    create_users
    create_books
    create_readings
  end

  def self.clean
    puts "Cleaning up..."
    User.delete_all
    Book.delete_all
    Reading.delete_all
  end

private
  def create_users
    puts "- creating #{users_count} users..."
    @users = FactoryGirl.create_list(:user, users_count)
  end

  def create_books
    puts "- creating #{books_count} books..."
    @books = FactoryGirl.create_list(:book, books_count)
  end

  def create_readings
    puts "- create readings..."
    @users.each do |user|
      random_number_of_readings_per_user.times do
        FactoryGirl.create(:reading, book: @books.sample, user: user)
      end
    end
  end

  def users_count
    (50 * @size_factor).to_i
  end

  def books_count
    (1000 * @size_factor).to_i
  end

  def number_of_readings_per_user
    (5..20)
  end

  def random_number_of_readings_per_user
    number_of_readings_per_user.to_a.sample
  end
end

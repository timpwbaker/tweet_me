class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  has_secure_password

  def self.guest
    find_by_name("Anonymous") || new_guest
  end

  def self.new_guest
    user = new(
      name: "Anonymous",
      email: "guest@twit-twoo.herokuapp.com",
      password: "$2a$10$bGCYIJXXJGtibD05tw495Os",
      password_confirmation: "$2a$10$bGCYIJXXJGtibD05tw495Os",
      guest: true
    )
    user.save
    user
  end
  private_class_method :new_guest
end

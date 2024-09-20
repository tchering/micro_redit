class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments

  validates :user_name, presence: { message: "Name should not be empty" }, uniqueness: true
end

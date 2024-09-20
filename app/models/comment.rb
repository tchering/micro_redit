class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, class_name: "User"

  validates :text, presence: true, length: { minimum: 3, maximum: 50 }
end

class Post < ApplicationRecord
    belongs_to :user
    has_many :posts
    has_many :comments
    has_one_attached :image

  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy
end

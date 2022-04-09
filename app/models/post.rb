class Post < ApplicationRecord
    belongs_to :user
    has_many :posts
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_one_attached :image

    validates :content, presence: true

  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy
end

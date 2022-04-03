class Post < ApplicationRecord
    belongs_to :user
    has_many :posts
    has_many :comments
    has_one_attached :image
end

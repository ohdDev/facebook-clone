class Post < ApplicationRecord
    # has_many :comments
    # belongs_to :user
    # has_many :feedback
    has_one_attached :picture

end

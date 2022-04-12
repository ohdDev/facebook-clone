class Setting < ApplicationRecord
    belongs_to :user

    validates :post_privacy, presence: true
    validates :friends_list_privacy, presence: true
end

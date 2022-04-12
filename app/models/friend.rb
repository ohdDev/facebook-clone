class Friend < ApplicationRecord
    belongs_to :follower, class_name: 'User'
    belongs_to :followee, class_name: 'User'
    

    validates :status, presence: true
    validates :follower_id, presence: true
    validates :followee_id, presence: true
    
    # validate :uniqueness_of_users_associations, :cant_be_friend_with_yourself

    # def uniqueness_of_users_associations
    #   if Friend.between(follower.id, followee.id).exists?
    #     errors.add(:base, 'Friendship already exists')
    #   end
    # end
  
    # def self.between(a, b)
    #     follower_id, followee_id = arel_table[:follower_id], arel_table[:followee_id]
    #   where(follower_id.eq(a).or(followee_id.eq(a)))
    #   .where(follower_id.eq(b).or(followee_id.eq(b))) 
    # end




end

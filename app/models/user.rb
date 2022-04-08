class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         has_many :post, dependent: :destroy, foreign_key: 'user_id'


         has_many :posts, dependent: :destroy, foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Friend'
  has_many :followees, through: :followed_users
    
  has_many :following_users, foreign_key: :followee_id, class_name: 'Friend'
  has_many :followers, through: :following_users
  
  validates :first_name, presence: true      
  validates :last_name, presence: true  
  validates :birthday, presence: true  
  validates :gender, presence: true  
  

  has_many :events
  has_many :notifications, as: :recipient

end

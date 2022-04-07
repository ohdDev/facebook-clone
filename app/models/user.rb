class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         has_many :post, dependent: :destroy, foreign_key: 'user_id'


         has_many :posts, dependent: :destroy, foreign_key: 'user_id'
  has_many :comments
  
  validates :first_name, presence: true      
  validates :last_name, presence: true  
  validates :birthday, presence: true  
  validates :gender, presence: true  
  
  has_many :notifications, as: :recipient
end

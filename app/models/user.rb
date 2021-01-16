class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :topic_users
  has_many :topics, through: :topic_users
  has_many :comments

  validates :nickname, presence: true, length: { maximum: 6 }
  
end

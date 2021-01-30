class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :topic_users
  has_many :topics, through: :topic_users
  has_many :posts
  has_many :sns_credentials

  validates :nickname, presence: true

  def self.from_omniauth(auth)
  end
end
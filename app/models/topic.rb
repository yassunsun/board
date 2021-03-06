class Topic < ApplicationRecord
  has_many :topic_users
  has_many :users, through: :topic_users, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :title, presence: true
end
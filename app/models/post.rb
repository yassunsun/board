class Post < ApplicationRecord
  belongs_to :topic

  validates :comment, presence: true
end
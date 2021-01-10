class Post < ApplicationRecord
  validates :comment, presence: true
end
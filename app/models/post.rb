class Post < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :content
  end
end
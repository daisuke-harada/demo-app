class Post < ApplicationRecord
  belongs_to :User
  validates :content, presence: true
end

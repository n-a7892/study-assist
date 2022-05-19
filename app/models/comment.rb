class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :save_data

  validates :comment, presence: true
end

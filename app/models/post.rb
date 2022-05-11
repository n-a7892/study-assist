class Post < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  belongs_to :user

  enum place: { home: 0, library: 1, cafe: 2, other: 3 }
end

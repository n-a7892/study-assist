class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :save_data
  
  validates_uniqueness_of :save_data_id, scope: :user_id
end

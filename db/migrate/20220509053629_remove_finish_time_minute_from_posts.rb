class RemoveFinishTimeMinuteFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :finish_time_minute, :integer
  end
end
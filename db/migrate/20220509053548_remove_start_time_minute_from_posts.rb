class RemoveStartTimeMinuteFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :start_time_minute, :integer
  end
end

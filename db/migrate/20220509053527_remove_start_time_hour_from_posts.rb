class RemoveStartTimeHourFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :start_time_hour, :integer
  end
end

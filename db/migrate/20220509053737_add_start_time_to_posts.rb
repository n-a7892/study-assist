class AddStartTimeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :start_time, :time, null: false
  end
end

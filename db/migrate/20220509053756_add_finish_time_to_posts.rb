class AddFinishTimeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :finish_time, :time, null: false
  end
end

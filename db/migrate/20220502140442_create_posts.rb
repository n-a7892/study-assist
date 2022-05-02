class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.date :day, null: false
      t.integer :start_time_hour, null: false
      t.integer :start_time_minute, null: false
      t.integer :finish_time_hour, null: false
      t.integer :finish_time_minute, null: false
      t.integer :place, null: false
      t.string :other_place
      t.text :content, null: false

      t.timestamps
    end
  end
end

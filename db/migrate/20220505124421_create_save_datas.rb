class CreateSaveDatas < ActiveRecord::Migration[6.1]
  def change
    create_table :save_datas do |t|
      t.integer :user_id, null: false
      t.date :day, null: false
      t.time :start_time, null: false
      t.time :finish_time, null: false
      t.integer :place, null: false
      t.string :other_place
      t.text :content, null: false

      t.timestamps
    end
  end
end

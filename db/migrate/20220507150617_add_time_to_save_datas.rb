class AddTimeToSaveDatas < ActiveRecord::Migration[6.1]
  def change
    add_column :save_datas, :time, :float
  end
end

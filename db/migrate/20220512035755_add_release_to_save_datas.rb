class AddReleaseToSaveDatas < ActiveRecord::Migration[6.1]
  def change
    add_column :save_datas, :release, :boolean, default: false, null: false
  end
end

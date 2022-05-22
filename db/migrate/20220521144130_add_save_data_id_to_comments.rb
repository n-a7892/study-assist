class AddSaveDataIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :save_data_id, :integer
  end
end

class AddSaveDataIdToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_column :favorites, :save_data_id, :integer
  end
end

class RemoveColumnsItemNameFromRecords < ActiveRecord::Migration[6.0]
  def change
    remove_column :records, :item_name
    remove_column :records, :item_calories
  end
end

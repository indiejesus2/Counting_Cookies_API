class DailyRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.string :item_name
      t.integer :item_calories
      t.references :record, index: true
      t.timestamps
    end
  end
end

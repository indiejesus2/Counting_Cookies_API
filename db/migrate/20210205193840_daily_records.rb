class DailyRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_records do |t|
      t.string :item_name
      t.integer :item_calories

      t.timestamps
    end
  end
end

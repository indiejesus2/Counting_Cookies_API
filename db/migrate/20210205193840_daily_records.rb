class DailyRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.string :item_name
      t.integer :item_calories
      t.belongs_to :records, null: false, foreign_key: :record_id
      t.timestamps
    end
  end
end

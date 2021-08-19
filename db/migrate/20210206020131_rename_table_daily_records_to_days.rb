class RenameTableDailyRecordsToDays < ActiveRecord::Migration[6.0]
  def change
    rename_table :daily_records, :days
  end
end

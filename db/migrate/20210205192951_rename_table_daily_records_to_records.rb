class RenameTableDailyRecordsToRecords < ActiveRecord::Migration[6.0]
  def change
    rename_table :daily_records, :records
  end
end

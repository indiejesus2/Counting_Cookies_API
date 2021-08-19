class AddRecordRefToDailyRecords < ActiveRecord::Migration[6.0]
  def change
    add_reference :daily_records, :records, foreign_key: true
  end
end

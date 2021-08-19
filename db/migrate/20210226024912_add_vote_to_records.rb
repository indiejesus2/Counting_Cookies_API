class AddVoteToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :vote, :integer, :default => 0
  end
end

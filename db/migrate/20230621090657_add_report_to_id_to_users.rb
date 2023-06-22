class AddReportToIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :report_to, foreign_key: { to_table: :users }
  end
end

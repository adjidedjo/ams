class AddReportToEmailToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :report_to_email, :string
  end
end

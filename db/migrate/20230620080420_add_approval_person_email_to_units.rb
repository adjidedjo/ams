class AddApprovalPersonEmailToUnits < ActiveRecord::Migration[7.0]
  def change
    add_column :units, :email_approval_person, :string
  end
end
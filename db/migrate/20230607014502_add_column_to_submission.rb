class AddColumnToSubmission < ActiveRecord::Migration[7.0]
  def change
    add_column :submissions, :status, :integer, default: 0
  end
end

class ChangeColumnTypeSubmission < ActiveRecord::Migration[7.0]
  def change
    change_column :submissions, :unit, :string
  end
end

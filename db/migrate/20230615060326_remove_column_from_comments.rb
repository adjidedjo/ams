class RemoveColumnFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :submission_id, :string
  end
end

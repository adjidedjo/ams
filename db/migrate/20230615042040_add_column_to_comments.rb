class AddColumnToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :category_submission, null: false, foreign_key: true
  end
end

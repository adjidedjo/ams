class RemoveLastApprovalFromCategorySubmissions < ActiveRecord::Migration[7.0]
  def change
    remove_column :category_submissions, :last_approval, :string
  end
end

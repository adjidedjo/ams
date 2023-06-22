class RemoveNextApprovalFromCategorySubmissions < ActiveRecord::Migration[7.0]
  def change
    remove_column :category_submissions, :next_approval, :string
  end
end

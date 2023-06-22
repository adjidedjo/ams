class AddLastApprovalToCategorySubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :category_submissions, :last_approval, :integer
  end
end

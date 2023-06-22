class AddNextApprovalToCategorySubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :category_submissions, :next_approval, :string
  end
end

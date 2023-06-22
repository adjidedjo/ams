class AddColumnToCategorySubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :category_submissions, :published, :boolean, default: false
    add_column :category_submissions, :status, :integer, default: false
  end
end

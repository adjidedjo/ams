class AddNextStageToCategorySubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :category_submissions, :next_stage, :integer
  end
end

class CreateCategorySubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :category_submissions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.json :user_answers

      t.timestamps
    end
  end
end

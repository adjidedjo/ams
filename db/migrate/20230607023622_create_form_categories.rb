class CreateFormCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :form_categories do |t|
      t.string :name
      t.belongs_to :unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end

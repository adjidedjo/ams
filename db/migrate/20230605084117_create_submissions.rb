class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.string :title
      t.text :description
      t.date :date_required
      t.string :attachment
      t.integer :quantity
      t.integer :unit
      t.string :contact_person
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :name
      t.belongs_to :department, null: false, foreign_key: true
      t.string "ancestry", collation: 'C', null: false
      t.index "ancestry"

      t.timestamps
    end
  end
end

class AddTermOfUseToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :term_of_use, :text
  end
end

class AddPublishedToSubmission < ActiveRecord::Migration[7.0]
  def change
    add_column :submissions, :published, :boolean, default: false
  end
end

json.extract! submission, :id, :title, :description, :date_required, :attachment, :quantity, :unit, :contact_person, :category_id, :created_at, :updated_at
json.url submission_url(submission, format: :json)

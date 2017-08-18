json.extract! email_adress, :id, :adress, :person_id, :created_at, :updated_at
json.url email_adress_url(email_adress, format: :json)

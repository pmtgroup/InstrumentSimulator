json.extract! company, :id, :name, :full_name, :inn, :orgn, :kind_of_action, :location, :created_at, :updated_at
json.url company_url(company, format: :json)

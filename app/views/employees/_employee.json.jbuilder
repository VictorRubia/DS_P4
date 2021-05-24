json.extract! employee, :id, :name, :dni, :password, :created_at, :updated_at
json.url employee_url(employee, format: :json)

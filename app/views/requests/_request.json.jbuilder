json.extract! request, :id, :id_objetivo, :tipo, :solved, :account_id, :created_at, :updated_at
json.url request_url(request, format: :json)

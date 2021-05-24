json.extract! transaction, :id, :amount, :account_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)

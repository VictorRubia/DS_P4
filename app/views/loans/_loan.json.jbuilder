json.extract! loan, :id, :amount, :meses, :interes, :account_id, :created_at, :updated_at
json.url loan_url(loan, format: :json)

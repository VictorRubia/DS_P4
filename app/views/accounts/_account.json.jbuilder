json.extract! account, :id, :name, :dni, :password, :nomina, :iban, :amount, :created_at, :updated_at
json.url account_url(account, format: :json)

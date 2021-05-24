class Account < ApplicationRecord
  has_many :cards
  has_many :loans
  has_many :requests
  has_many :transactions
  has_many :investments
  has_many :transfers
end
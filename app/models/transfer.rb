class Transfer < ApplicationRecord
  belongs_to :account, :class_name => "Account"
  belongs_to :account2, class_name: "Account", :foreign_key => "account2_id"
end

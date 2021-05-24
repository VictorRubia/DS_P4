class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :dni
      t.string :password
      t.decimal :nomina
      t.string :iban
      t.decimal :amount

      t.timestamps
    end
  end
end

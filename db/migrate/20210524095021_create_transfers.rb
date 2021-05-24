class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers do |t|
      t.decimal :amount
      t.references :account, foreign_key: { to_table: 'accounts' }
      t.references :account2, foreign_key: { to_table: 'accounts' }
      t.string :concepto

      t.timestamps
    end
  end
end

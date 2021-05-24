class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.references :account, null: false, foreign_key: true
      t.string :concepto

      t.timestamps
    end
  end
end

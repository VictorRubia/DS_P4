class CreateInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :investments do |t|
      t.decimal :amount
      t.integer :meses
      t.decimal :interes
      t.references :account, null: false, foreign_key: true
      t.string :concepto

      t.timestamps
    end
  end
end

class CreateCuenta < ActiveRecord::Migration[6.1]
  def change
    create_table :cuenta do |t|
      t.string :iban
      t.decimal :saldo
      t.belongs_to :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end

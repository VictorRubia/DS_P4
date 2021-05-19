class CreateTarjeta < ActiveRecord::Migration[6.1]
  def change
    create_table :tarjeta do |t|
      t.integer :num_tarjeta
      t.belongs_to :cuenta, null: false, foreign_key: true

      t.timestamps
    end
  end
end

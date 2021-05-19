class CreatePrestamos < ActiveRecord::Migration[6.1]
  def change
    create_table :prestamos do |t|
      t.decimal :cantidad
      t.integer :cuotas
      t.decimal :interes
      t.belongs_to :cuenta, null: false, foreign_key: true

      t.timestamps
    end
  end
end

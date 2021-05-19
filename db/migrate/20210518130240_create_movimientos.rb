class CreateMovimientos < ActiveRecord::Migration[6.1]
  def change
    create_table :movimientos do |t|
      t.decimal :cantidad
      t.belongs_to :cuenta, null: false, foreign_key: true

      t.timestamps
    end
  end
end

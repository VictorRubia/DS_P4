class CreateInversions < ActiveRecord::Migration[6.1]
  def change
    create_table :inversions do |t|
      t.decimal :cantidad
      t.integer :meses
      t.decimal :interes
      t.belongs_to :cuenta, null: false, foreign_key: true

      t.timestamps
    end
  end
end

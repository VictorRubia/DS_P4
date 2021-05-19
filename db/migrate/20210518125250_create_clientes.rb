class CreateClientes < ActiveRecord::Migration[6.1]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :dni
      t.string :password
      t.decimal :nomina

      t.timestamps
    end
  end
end

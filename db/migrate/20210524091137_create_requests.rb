class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.integer :id_objetivo
      t.integer :tipo
      t.integer :solved
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end

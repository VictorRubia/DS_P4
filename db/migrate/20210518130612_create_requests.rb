class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.integer :tipo
      t.integer :id_objetivo
      t.belongs_to :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end

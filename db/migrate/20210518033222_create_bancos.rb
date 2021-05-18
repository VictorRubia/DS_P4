class CreateBancos < ActiveRecord::Migration[6.1]
  def change
    create_table :bancos do |t|

      t.timestamps
    end
  end
end

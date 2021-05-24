class AddFechayTipoCard < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :fecha, :string
    add_column :cards, :tipo, :string
  end
end

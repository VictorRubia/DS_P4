class AddCvvToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :cvv, :integer
  end
end

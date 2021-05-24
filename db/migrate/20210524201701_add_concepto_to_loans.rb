class AddConceptoToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :concepto, :string
  end
end

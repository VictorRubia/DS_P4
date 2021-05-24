class CambiarDecimalAccounts < ActiveRecord::Migration[6.1]
  def change
    change_column :accounts, :nomina, :decimal, :precision => 10, :scale => 2
    change_column :accounts, :amount, :decimal, :precision => 10, :scale => 2
    change_column :transfers, :amount, :decimal, :precision => 10, :scale => 2
    change_column :investments, :amount, :decimal, :precision => 10, :scale => 2
    change_column :investments, :interes, :decimal, :precision => 10, :scale => 2
    change_column :transactions, :amount, :decimal, :precision => 10, :scale => 2
    change_column :loans, :amount, :decimal, :precision => 10, :scale => 2
    change_column :loans, :interes, :decimal, :precision => 10, :scale => 2

  end
end

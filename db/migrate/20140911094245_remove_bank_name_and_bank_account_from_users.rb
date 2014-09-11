class RemoveBankNameAndBankAccountFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :bank_name, :string
    remove_column :users, :bank_account, :integer
  end
end

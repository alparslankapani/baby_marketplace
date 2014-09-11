class AddBankNameAndBankAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bank_name, :string
    add_column :users, :bank_account, :integer
  end
end

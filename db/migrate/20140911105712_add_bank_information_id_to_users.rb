class AddBankInformationIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bank_information_id, :integer
  end
end

class ChangeBankAccountForBankInformations < ActiveRecord::Migration
  def change
  	    change_column :bank_informations, :bank_account, :string
  end
end

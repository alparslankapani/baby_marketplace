class CreateBankInformations < ActiveRecord::Migration
  def change
    create_table :bank_informations do |t|
      t.string :bank_name
      t.integer :bank_account

      t.timestamps
    end
  end
end

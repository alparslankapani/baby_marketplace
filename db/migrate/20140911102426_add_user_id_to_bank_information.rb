class AddUserIdToBankInformation < ActiveRecord::Migration
  def change
    add_column :bank_informations, :user_id, :integer
  end
end

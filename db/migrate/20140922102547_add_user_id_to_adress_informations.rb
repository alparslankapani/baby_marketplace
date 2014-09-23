class AddUserIdToAdressInformations < ActiveRecord::Migration
  def change
    add_column :adress_informations, :user_id, :integer
  end
end

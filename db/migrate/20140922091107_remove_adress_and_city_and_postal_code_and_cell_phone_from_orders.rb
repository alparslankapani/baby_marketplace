class RemoveAdressAndCityAndPostalCodeAndCellPhoneFromOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :adress, :string
  	remove_column :orders, :city, :string
  	remove_column :orders, :postal_code, :string
  	remove_column :orders, :cell_phone, :string
  end
end

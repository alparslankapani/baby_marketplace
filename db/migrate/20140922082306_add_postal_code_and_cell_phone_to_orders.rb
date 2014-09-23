class AddPostalCodeAndCellPhoneToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :postal_code, :string
    add_column :orders, :cell_phone, :string
  end
end

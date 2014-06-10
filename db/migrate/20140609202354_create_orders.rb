class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :adress
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end

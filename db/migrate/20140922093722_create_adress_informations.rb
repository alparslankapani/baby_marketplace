class CreateAdressInformations < ActiveRecord::Migration
  def change
    create_table :adress_informations do |t|
      t.text :adress
      t.string :postal_code
      t.string :cell_phone
      t.string :city

      t.timestamps
    end
  end
end

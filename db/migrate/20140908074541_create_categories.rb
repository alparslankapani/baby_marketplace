class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :araba
      t.string :mobilya
      t.string :giyim
      t.string :oyuncak
      t.string :aksesuar
      t.string :diger

      t.timestamps
    end
  end
end

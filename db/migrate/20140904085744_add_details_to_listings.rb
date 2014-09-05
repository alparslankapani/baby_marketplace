class AddDetailsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :category, :string
    add_column :listings, :postal_code, :integer
    add_column :listings, :location, :string
    add_column :listings, :product_condition, :string
    add_column :listings, :gender, :string
    add_column :listings, :age_range, :string
    add_column :listings, :delivery_information, :string
  end
end

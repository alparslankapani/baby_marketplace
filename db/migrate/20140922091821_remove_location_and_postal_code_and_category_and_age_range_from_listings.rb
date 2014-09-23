class RemoveLocationAndPostalCodeAndCategoryAndAgeRangeFromListings < ActiveRecord::Migration
  def change
  	remove_column :listings, :location, :string
  	remove_column :listings, :postal_code, :integer
  	remove_column :listings, :category, :string
  	remove_column :listings, :age_range, :string
  end
end

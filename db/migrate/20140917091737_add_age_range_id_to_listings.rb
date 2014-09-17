class AddAgeRangeIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :age_range_id, :integer
  end
end

class AddGenderIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :gender_id, :integer
  end
end

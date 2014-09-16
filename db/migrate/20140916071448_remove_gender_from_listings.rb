class RemoveGenderFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :gender, :string
  end
end

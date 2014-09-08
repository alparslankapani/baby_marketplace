class AddListingIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :listing_id, :integer
  end
end

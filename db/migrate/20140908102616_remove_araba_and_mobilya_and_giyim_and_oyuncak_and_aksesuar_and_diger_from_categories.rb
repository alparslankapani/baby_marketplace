class RemoveArabaAndMobilyaAndGiyimAndOyuncakAndAksesuarAndDigerFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :araba, :string
    remove_column :categories, :mobilya, :string
    remove_column :categories, :giyim, :string
    remove_column :categories, :oyuncak, :string
    remove_column :categories, :aksesuar, :string
    remove_column :categories, :diger, :string
  end
end

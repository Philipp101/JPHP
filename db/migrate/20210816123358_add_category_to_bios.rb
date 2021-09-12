class AddCategoryToBios < ActiveRecord::Migration[6.0]
  def change
    add_column :bios, :category, :string
  end
end

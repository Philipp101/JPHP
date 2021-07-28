class CreateBios < ActiveRecord::Migration[6.0]
  def change
    create_table :bios do |t|
      t.integer :bioyear
      t.string :institute
      t.string :title
      t.string :place

      t.timestamps
    end
  end
end

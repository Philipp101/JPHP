class AddEventToCatalog < ActiveRecord::Migration[6.0]
  def change
    add_reference :catalogs, :event, null: false, foreign_key: true
  end
end

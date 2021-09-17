class AddAttachmentToCatalog < ActiveRecord::Migration[6.0]
  def change
    add_reference :catalogs, :attachment, null: false, foreign_key: true
  end
end

class RemoveAttachmentFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_reference :events, :attachment, null: false, foreign_key: true
  end
end

class RemoveEventFromAttachments < ActiveRecord::Migration[6.0]
  def change
    remove_reference :attachments, :event, null: false, foreign_key: true
  end
end

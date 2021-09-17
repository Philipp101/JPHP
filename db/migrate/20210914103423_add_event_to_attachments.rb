class AddEventToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_reference :attachments, :event, foreign_key: true
  end
end

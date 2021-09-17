class AddAttachmentToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :attachment, foreign_key: true
  end
end

class RemoveAvatarFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :avatar, :string
  end
end

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :eventdate
      t.text :eventtext
      t.string :links

      t.timestamps
    end
  end
end

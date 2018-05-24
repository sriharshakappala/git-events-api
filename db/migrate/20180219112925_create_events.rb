class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :uuid, :limit => 8
      t.string :event_type
      t.references :actor
      t.references :repo
      t.datetime :occured_at
      t.timestamps
    end
  end
end

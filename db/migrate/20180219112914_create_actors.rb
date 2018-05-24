class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.integer :uuid, :limit => 8
      t.string :login
      t.string :avatar_url
      t.timestamps
    end
  end
end

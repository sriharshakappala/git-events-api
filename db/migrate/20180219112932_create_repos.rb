class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.integer :uuid, :limit => 8
      t.string :name
      t.string :url
      t.timestamps
    end
  end
end

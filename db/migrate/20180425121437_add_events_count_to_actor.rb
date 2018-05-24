class AddEventsCountToActor < ActiveRecord::Migration
  def change
    add_column :actors, :events_count, :integer, null: true
  end
end

class AddLastEventAtToActor < ActiveRecord::Migration
  def change
    add_column :actors, :last_event_at, :datetime
  end
end

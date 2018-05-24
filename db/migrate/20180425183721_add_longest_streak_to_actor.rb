class AddLongestStreakToActor < ActiveRecord::Migration
  def change
    add_column :actors, :longest_streak, :integer, :default => 0
  end
end

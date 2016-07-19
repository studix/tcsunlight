class AddEventToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :participate_event, :boolean
  end
end

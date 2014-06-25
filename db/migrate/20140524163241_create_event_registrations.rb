class CreateEventRegistrations < ActiveRecord::Migration
  def change
    create_table :event_registrations do |t|
      t.string :Email
      t.string :Name
      t.string :Vorname
      t.integer :num_persons
      t.integer :event_id

      t.timestamps
    end
  end
end

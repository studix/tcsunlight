class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :title
      t.date :spielplan_verfuegbar_datum

      t.timestamps
    end
  end
end

class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :Name
      t.string :Vorname
      t.string :Email
      t.string :TelefonNummer
      t.string :Klassierung
      t.float :Klassierungswert
      t.string :partner_team_cup
      t.boolean :draw_men_singles
      t.boolean :draw_team_cup
      t.boolean :draw_men_doubles
      t.string :partner_men_doubles
      t.integer :tournament_id
      t.string :comment

      t.timestamps
    end
  end
end

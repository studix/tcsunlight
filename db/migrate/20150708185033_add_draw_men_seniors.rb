class AddDrawMenSeniors < ActiveRecord::Migration
  def up
  	change_table :registrations do |t|
    t.boolean :draw_men_seniors
    end
  end

  def down
  end
end

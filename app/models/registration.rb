# encoding: utf-8
class Registration < ActiveRecord::Base
  attr_accessible :Email, :Klassierung, :Klassierungswert, :Name, :TelefonNummer, :Vorname, :draw_men_doubles, :draw_men_singles, :draw_men_seniors, :draw_team_cup, :partner_men_doubles, :partner_team_cup, :tournament_id, :comment
  validates_presence_of :Name, :Vorname, :Email, :tournament_id, :TelefonNummer, :message => " ist obligatorisch."
  validates_numericality_of :Klassierungswert, :allow_nil => true, :message => " ist ungültig."
  validates_format_of :Email, :with =>%r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i, :message => " ist ungültig."
  belongs_to :tournament

  def registered_draws
     draws = []
    if(draw_men_singles)
       draws<< "Herren-Einzel"
    end
    if(draw_men_seniors)
       draws<< "Einzel Senioren"
    end
    if(draw_team_cup)
       draws<< "Team-Cup.  Partner/Partnerin: " + partner_team_cup
    end
    if(draw_men_doubles)
       draws<< "Herren-Doppel. Partner: " + partner_men_doubles
    end
    return draws
  end
end

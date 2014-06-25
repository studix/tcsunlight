class Tournament < ActiveRecord::Base
	validates_presence_of :title, :spielplan_verfuegbar_datum
    attr_accessible :title, :spielplan_verfuegbar_datum
    has_many :registrations
end

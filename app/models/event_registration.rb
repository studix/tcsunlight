# encoding: utf-8
class EventRegistration < ActiveRecord::Base
	attr_accessible :Email, :Name, :Vorname, :event_id, :num_persons
	validates_presence_of :Name, :Vorname, :Email, :event_id, :message => " ist obligatorisch."
	validates_numericality_of :num_persons, :message => " ist ungültig."
    validates_format_of :Email, :with =>%r{^(?:[_a-z0-9-]+)(\.[_a-z0-9-]+)*@([a-z0-9-]+)(\.[a-zA-Z0-9\-\.]+)*(\.[a-z]{2,4})$}i, :message => " ist ungültig."
    belongs_to :event
end

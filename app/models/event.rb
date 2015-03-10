class Event < ActiveRecord::Base
    has_many :event_attendings, :foreign_key => :attended_event_id
    has_many :attendees, :through => :event_attendings
    belongs_to :creator, :class_name => "User"
end

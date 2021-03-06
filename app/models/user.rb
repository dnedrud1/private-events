class User < ActiveRecord::Base
    has_many :event_attendings, :foreign_key => :attendee_id
    has_many :attended_events, :through => :event_attendings
    has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
    
    def upcoming_events
        self.attended_events.select do |event|
            event.date >= Time.now
        end
    end
    
    def previous_events
        self.attended_events.select do |event|
            event.date < Time.now
        end
    end
    
end
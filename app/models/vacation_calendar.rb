class VacationCalendar < ActiveRecord::Base
  has_many :vacation_calendar_views, :dependent => :destroy
  has_many :vacation_calendar_events, :dependent => :destroy
  belongs_to :project
end

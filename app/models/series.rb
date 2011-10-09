class Series < ActiveRecord::Base

  has_many :events

  validates_presence_of :title

  scope :active, where(:active => true)

  def active_events
    events.active
  end

end

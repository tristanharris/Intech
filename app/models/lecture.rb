class Lecture < ActiveRecord::Base

  belongs_to :event
  #delegate :title, :to => :series, :prefix => true, :allow_nil => true

  validates_presence_of :title, :event_id, :time

  scope :active, lambda { where(:open => true).where('lectures.time > ?', Time.now) }

  def date
    time.to_date
  end

end

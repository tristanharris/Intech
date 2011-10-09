class Event < ActiveRecord::Base

  belongs_to :series
  delegate :title, :to => :series, :prefix => true, :allow_nil => true

  validates_presence_of :title, :series_id, :time

  scope :active, lambda { where(:open => true).where('time > ?', Time.now) }

  def date
    time.to_date
  end

end

class Lecture < ActiveRecord::Base

  belongs_to :series
  delegate :title, :to => :series, :prefix => true, :allow_nil => true

  scope :active, lambda { where(:open => true).where('time > ?', Time.now) }

  def date
    time.to_date
  end

end

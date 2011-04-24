class Lecture < ActiveRecord::Base

  scope :active, lambda { where('time > ?', Time.now) }

  def date
    time.to_date
  end
end

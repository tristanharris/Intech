class Lecture < ActiveRecord::Base

  belongs_to :series

  scope :active, lambda { where(:open => true).where('time > ?', Time.now) }

  def date
    time.to_date
  end

end

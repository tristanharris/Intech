class Series < ActiveRecord::Base

  has_many :events
  has_many :lectures, :through => :events

  validates_presence_of :title

  scope :active, where(:active => true)

  def active_lectures
    lectures.active
  end

end

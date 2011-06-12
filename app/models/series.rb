class Series < ActiveRecord::Base

  has_many :lectures

  validates_presence_of :title

  scope :active, where(:active => true)

  def active_lectures
    lectures.active
  end

end

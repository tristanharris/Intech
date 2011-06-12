class Series < ActiveRecord::Base

  has_many :lectures

  scope :active, where(:active => true)

  def active_lectures
    lectures.active
  end

end

class Lecture < ActiveRecord::Base

  def date
    time.to_date
  end
end

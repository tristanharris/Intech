class Order < ActiveRecord::Base

  has_many :lines, :class_name => 'OrderLine'

  def add(data)
    lines.build(data)
    save
  end

end

class Order < ActiveRecord::Base

  has_many :lines, :class_name => 'OrderLine'

  def add(item)
    lines.build(:item => item, :quantity => 1)
    save
  end

end

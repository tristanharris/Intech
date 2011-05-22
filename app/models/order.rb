class Order < ActiveRecord::Base

  has_many :lines, :class_name => 'OrderLine'

  def add(data)
    lines.build(data)
    save
  end

  def remove(item)
    line = lines.all.find {|line| line.item == item}
    if line
      lines.delete(line)
      save
    end
  end

end

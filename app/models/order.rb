class Order < ActiveRecord::Base

  has_many :lines, :class_name => 'OrderLine'

  def add(data)
    line = find_item_line(data[:item_id].to_i)
    if line.nil?
      lines.build(data)
      save
    else
      line.quantity += data[:quantity].to_i
      line.save
    end
  end

  def remove(item)
    line = find_item_line(item)
    if line
      lines.delete(line)
      save
    end
  end

  def find_item_line(item)
    item = item.id unless item.is_a? Fixnum
    lines.all.find {|line| line.item_id == item}
  end

end

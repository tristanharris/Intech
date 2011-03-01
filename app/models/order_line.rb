class OrderLine < ActiveRecord::Base

  belongs_to :order
  belongs_to :item, :class_name => 'Lecture'

  delegate :title, :to => :item
end

class OrderLine < ActiveRecord::Base

  belongs_to :order
  belongs_to :item, :class_name => 'Event'

  delegate :title, :to => :item
end

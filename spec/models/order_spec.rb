require 'spec_helper'

describe Order do
  subject { Order.new }

  describe 'add' do
    it 'adds an item to the order' do
      subject.add(mock_model(Lecture))
      subject.lines.size.should == 1
    end
  end

end

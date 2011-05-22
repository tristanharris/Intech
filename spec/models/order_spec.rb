require 'spec_helper'

describe Order do
  subject { Order.new }

  describe 'add' do
    it 'adds an item to the order' do
      subject.add(:item => mock_model(Lecture))
      subject.lines.size.should == 1
    end
  end

  describe 'remove' do
    before do
      subject.add(:item => mock_model(Lecture, :id => 2))
      @item = mock_model(Lecture, :id => 3)
      subject.add(:item => @item)
      subject.lines.size.should == 2
      Lecture.stub!(:find => @item)
    end

    it 'removes an item from the order' do
      subject.remove(@item)
      subject.lines.size.should == 1
    end
  end

end

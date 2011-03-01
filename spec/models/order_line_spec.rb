require 'spec_helper'

describe OrderLine do
  before do
    @item = mock_model(Lecture)
  end

  subject { OrderLine.new(:item => @item) }

  its(:title) do
    title = mock(:title)
    @item.stub!(:title => title)
    should == title
  end

end

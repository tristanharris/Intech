require 'spec_helper'

describe LecturesController do
  describe 'show' do
    before do
      @lecture = mock_model(Lecture)
      @active = mock(:active_lectures, :find => @lecture)
      series = mock(:series, :active_lectures => @active)
      @active_series = mock(:active_series, :find => series)
      Series.stub!(:active => @active_series)
    end

    it 'finds the lecture' do
      id = mock(:id)
      @active_series.should_receive(:find).with(99)
      @active.should_receive(:find).with(id)
      get :show, :id => id, :series_id => 99
      assigns(:lecture).should == @lecture
    end

    it 'builds an order line' do
      line = mock(:line)
      OrderLine.should_receive(:new).with(:item => @lecture, :quantity => 1).and_return(line)
      get :show, :id => 1, :series_id => 99
      assigns(:lecture_item).should == line
    end

    it 'renders the show page' do
      Lecture.stub!(:find)
      get :show, :id => 1, :series_id => 99
      response.should render_template('show')
    end
  end

end

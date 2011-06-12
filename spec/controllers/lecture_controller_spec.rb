require 'spec_helper'

describe LectureController do
  describe 'show' do
    before do
      @lecture = mock_model(Lecture)
      @active = mock(:active_lectures, :find => @lecture)
      Lecture.stub!(:active => @active)
    end

    it 'finds the lecture' do
      id = mock(:id)
      Lecture.should_receive(:active)
      @active.should_receive(:find).with(id)
      get :show, :id => id
      assigns(:lecture).should == @lecture
    end

    it 'builds an order line' do
      line = mock(:line)
      OrderLine.should_receive(:new).with(:item => @lecture, :quantity => 1).and_return(line)
      get :show, :id => 1
      assigns(:lecture_item).should == line
    end

    it 'renders the show page' do
      Lecture.stub!(:find)
      get :show, :id => 1
      response.should render_template('show')
    end
  end

  describe 'index' do
    it 'finds the active lectures' do
      lectures = mock (:lectures)
      Lecture.should_receive(:active).and_return(lectures)
      get :index
      assigns(:lectures).should == lectures
    end

    it 'renders the index page' do
      Lecture.stub!(:active)
      get :index
      response.should render_template('index')
    end

  end

end

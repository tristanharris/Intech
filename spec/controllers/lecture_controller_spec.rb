require 'spec_helper'

describe LectureController do
  describe 'show' do
    it 'find the lecture' do
      id = mock(:id)
      lecture = mock(:lecture)
      Lecture.should_receive(:find).with(id).and_return lecture
      get :show, :id => id
      assigns(:lecture).should == lecture
    end

    it 'renders the show page' do
      Lecture.stub!(:find)
      get :show, :id => 1
      response.should render_template('show')
    end
  end
end

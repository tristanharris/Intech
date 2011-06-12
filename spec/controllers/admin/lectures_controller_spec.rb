require 'spec_helper'

describe Admin::LecturesController do
  describe 'index' do
    it 'fetches all lectures' do
      lectures = mock(:lectures)
      Lecture.should_receive(:scoped).and_return(lectures)
      get :index
      assigns(:lectures).should == lectures
    end

    it 'renders the index page' do
      get :index
      response.should render_template(:index)
    end
  end

  describe 'new' do
    it 'creates a new Lecture' do
      lecture = mock(:lecture)
      Lecture.should_receive(:new).and_return(lecture)
      get :new
      assigns(:lecture).should == lecture
    end

    it 'renders the edit page' do
      get :new
      response.should render_template(:edit)
    end
  end

  describe 'create' do
    before do
      @lecture = mock(:lecture)
      @lecture.stub!(:save)
      Lecture.stub!(:new => @lecture)
    end

    it 'creates a new lecture' do
      data = mock(:data)
      Lecture.should_receive(:new).with(data)
      post :create, {:lecture => data}
    end

    context 'successfully' do
      before do
        @lecture.stub!(:save => true)
      end

      it 'redirect to the index' do
        post :create
        response.should redirect_to(admin_lectures_path)
      end
    end

    context 'fails' do
      before do
        @lecture.stub!(:save => false)
      end

      it 'render the edit template' do
        post :create
        response.should render_template :edit
      end
    end
  end

end

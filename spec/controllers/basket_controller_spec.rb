require 'spec_helper'

describe BasketController do
  describe 'add' do
    before do
      @basket = mock(:basket, :add => true, :id => 1)
      controller.stub!(:current_basket => @basket)
      @item = mock(:item)
      Lecture.stub!(:find => @item)
    end

    it 'adds a product to the basket' do
      @basket.should_receive(:add).with(@item)
      put :add, :id => 2
    end

    it 'redirects to the basket' do
      put :add, :id => 2
      response.should redirect_to basket_path
    end
  end

  describe 'show' do
    it 'renders the basket' do
      get :show
      response.should render_template :show
    end
  end

end

require 'spec_helper'

describe BasketController do
  describe 'add' do
    before do
      @basket = mock(:basket, :add => true, :id => 1)
      controller.stub!(:current_basket => @basket)
      @data = {'some' => 'data'}
    end

    it 'adds a product to the basket' do
      @basket.should_receive(:add).with(@data)
      post :add, {:order_line => @data}
    end

    it 'redirects to the basket' do
      post :add, {:order_line => @data}
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

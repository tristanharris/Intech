require 'spec_helper'

describe ApplicationController do
  describe 'current_basket' do

    context 'with no existing basket' do
      it 'returns a new basket' do
        basket = mock(:basket)
        Order.stub!(:new => basket)
        session[:basket_id] = nil
        controller.current_basket.should == basket
      end
    end

    context 'with an existing basket' do
      it 'returns the current basket' do
        basket = mock(:basket)
        Order.stub!(:find => basket)
        session[:basket_id] = 2
        controller.current_basket.should == basket
      end
    end

  end
end

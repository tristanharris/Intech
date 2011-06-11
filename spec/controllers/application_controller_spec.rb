require 'spec_helper'

describe ApplicationController do
  describe 'current_basket' do

    before do
      @basket = Order.create!
    end

    context 'with no existing basket' do
      it 'returns a new basket' do
        session[:basket_id] = nil
        controller.current_basket.should be_an Order
        controller.current_basket.should be_new_record
      end
    end

    context 'with an existing basket' do
      it 'returns the current basket' do
        session[:basket_id] = @basket.id
        controller.current_basket.should == @basket
      end
    end

    context 'with no missing basket' do
      it 'returns a new basket' do
        session[:basket_id] = @basket.id + 1
        controller.current_basket.should be_an Order
        controller.current_basket.should be_new_record
      end
    end

  end
end

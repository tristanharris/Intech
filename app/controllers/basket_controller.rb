class BasketController < ApplicationController

  def add
    current_basket.add(params[:order_line])
    redirect_to basket_path
  end

  def show
  end

  def remove
    current_basket.remove(Lecture.find(params[:item]))
    redirect_to basket_path
  end

end

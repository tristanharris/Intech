class BasketController < ApplicationController

  def add
    current_basket.add(Lecture.find(params[:id]))
    redirect_to basket_path
  end

  def show
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_basket

  after_filter :save_basket_id

  def current_basket
    return @current_basket unless @current_basket.nil?
    if session[:basket_id].nil?
      @current_basket = Order.new
    else
      @current_basket = Order.find(session[:basket_id]) unless session[:basket_id].nil?
    end
  end

  private
  def save_basket_id
    session[:basket_id] = current_basket.id
  end

end

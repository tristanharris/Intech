class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_basket

  after_filter :save_basket_id

  def current_basket
    return @current_basket unless @current_basket.nil?
    @current_basket = Order.find_by_id(session[:basket_id]) unless session[:basket_id].nil?
    @current_basket = Order.new if @current_basket.nil?
    return @current_basket
  end

  private
  def save_basket_id
    session[:basket_id] = current_basket.id
  end

end

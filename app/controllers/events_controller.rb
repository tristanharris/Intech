class EventsController < ApplicationController

  def show
    series = Series.active.find(params[:series_id])
    @event = series.active_events.find(params[:id])
    @event_item = OrderLine.new(:item => @event, :quantity => 1)
  end

end

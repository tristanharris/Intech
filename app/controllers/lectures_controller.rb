class LecturesController < ApplicationController

  def show
    series = Series.active.find(params[:series_id])
    @lecture = series.active_lectures.find(params[:id])
    @lecture_item = OrderLine.new(:item => @lecture, :quantity => 1)
  end

end

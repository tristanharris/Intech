class SeriesController < ApplicationController

  def index
    @series = Series.active
  end

  def show
    @series = Series.find(params[:id])
  end

end

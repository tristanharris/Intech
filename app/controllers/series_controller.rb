class SeriesController < ApplicationController

  def index
    @series = Series.active
  end

  def show
    @series = Series.active.find(params[:id])
  end

end

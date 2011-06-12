class Admin::SeriesController < ApplicationController

  before_filter :set_section

  def index
    @series = Series.all
  end

  def new
    @series = Series.new
    render :edit
  end

  def edit
    @series = Series.find(params[:id])
    render :edit
  end

  def create
    @series = Series.new(params[:series])
    if @series.save
      redirect_to [:admin, Series], :notice => 'Series created'
    else
      render :edit
    end
  end

  def update
    @series = Series.find(params[:id])
    if @series.update_attributes(params[:series])
      redirect_to [:admin, Series], :notice => 'Series updated'
    else
      render :edit
    end
  end

  private

  def set_section
    @section = 'admin'
  end

end

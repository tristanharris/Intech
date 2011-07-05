class Admin::LecturesController < ApplicationController

  before_filter :set_section
  before_filter :get_lectures

  def index
  end

  def new
    @lecture = Lecture.new(:series => @series)
    render :edit
  end

  def edit
    @lecture = Lecture.find(params[:id])
    render :edit
  end

  def create
    @lecture = Lecture.new(params[:lecture])
    if @lecture.save
      redirect_to [:admin, @series, Lecture], :notice => 'Lecture created'
    else
      render :edit
    end
  end

  def update
    @lecture = Lecture.find(params[:id])
    if @lecture.update_attributes(params[:lecture])
      redirect_to [:admin, @series, Lecture], :notice => 'Lecture updated'
    else
      render :edit
    end
  end

  private

  def set_section
    @section = 'admin'
  end

  def get_lectures
    if params[:series_id]
      @series = Series.find(params[:series_id])
      @lectures = @series.lectures
    else
      @lectures = Lecture.scoped
    end
  end

end

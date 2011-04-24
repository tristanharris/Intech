class Admin::LecturesController < ApplicationController

  before_filter :set_section

  def index
    @lectures = Lecture.all
  end

  def new
    @lecture = Lecture.new
    render :edit
  end

  def create
    @lecture = Lecture.new(params[:lecture])
    if @lecture.save
      redirect_to [:admin, Lecture]
    else
      render :edit
    end
  end

  private

  def set_section
    @section = 'admin'
  end

end

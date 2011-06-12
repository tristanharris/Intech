class LectureController < ApplicationController

  def index
    @lectures = Lecture.active
  end

  def show
    @lecture = Lecture.active.find(params[:id])
    @lecture_item = OrderLine.new(:item => @lecture, :quantity => 1)
  end

end

class LectureController < ApplicationController

  def index
    @lectures = Lecture.active
  end

  def show
    @lecture = Lecture.find(params[:id])
  end

end

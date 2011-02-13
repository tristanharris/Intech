class LectureController < ApplicationController

  def show
    @lecture = Lecture.find(params[:id])
  end

end

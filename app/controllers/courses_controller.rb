class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def create
  end

  def show
    @course = Course.find_by_id(params[:id])  
  end

end

class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def create
    @course = Course.new(params[:course])
    respond_to do |format|
      if @course.save 
        format.html { render text: "succesfully created!" }
      else 
        format.html { render text: "error occured!" }
      end
    end
  end

  def show
    @course = Course.find_by_uuid(params[:id])  
    @students = @course.students
  end

  def new
    @course = Course.create(params[:course])
  end

end

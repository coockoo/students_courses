class StudentsController < ApplicationController
  
  # /students GET
  def index
    @students = Student.all
  end

  # /students POST
  def create
    @student = Student.create(params[:student])
    render text: "#{@student.id}: #{@student.name}: #{@student.email} created"
  end

  # /students/1 GET
  def show
    @student = Student.find_by_id(params[:id])
    @courses = Course.all - @student.courses
  end

  # /students/new GET
  def new
    @student = Student.create(params[:student])
  end

  # /students/1/edit GET
  def edit
  end

  # /students/1 PUT
  def update
    @student = Student.find_by_id(params[:id])
    @selected = params[:selected_courses]
    logger.info @selected
    @selected.each { |key, value|
      puts key
      puts value
      if value == "1"
        puts "Enrolled"
        @student.courses << Course.find_by_id(key) 
      end
    }
    respond_to do |format|
      if @student.save 
        format.html { render text: "succesfully enrolled!" }
      else 
        format.html { render text: "error occured!" }
      end
    end


  end

  # /students/1 DELETE
  def destroy
  end

end

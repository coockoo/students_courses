class StudentsController < ApplicationController

# /students GET
  def index
    @students = Student.all
  end

  # /students POST
  def create
    @student = Student.new(params[:student])
    respond_to do |format|
      if @student.save
        format.html { render text: "#{@student.id}: #{@student.name}: #{@student.email} created" } 
      else
        format.html { render text: "Something wrong! #{@student.errors.first}" }
      end
    end
  end

  # /students/1 GET
  def show
    unless @student = Student.find_by_uuid(params[:id])
      render text: "Page not found", status: 404
    end
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
    @student = Student.find_by_uuid(params[:id])
    selected = params[:selected_courses] 
    selected.each { |key, value|
      if value.to_i == 1
        @student.courses << Course.find_by_uuid(key)
      end
    }
    respond_to do |format|
      if @student.save 
        format.html { redirect_to :action => "show" }
      else 
        format.html { render text: "Trouble!" }
      end
    end
  end

  # /students/1 DELETE
  def destroy
  end

end

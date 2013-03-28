class StudentsController < ApplicationController

  before_filter :authenticate_student!, :except => [:index, :new, :show, :create]

  # /students GET
  def index
    @students = Student.all
    @student = Student.new
    respond_to do |format|
      format.html
    end
  end

  # /students POST
  def create
    @student = Student.new(params[:student])
    respond_to do |format|
      if @student.save
        format.js { render :partial => "new_student", :status => :ok, content_type: 'text/html' }
        format.html { redirect_to student_path(@student) }
      else
        format.html { render "new" }
      end
    end
  end

  # /students/1 GET
  def show
    unless @student = Student.find_by_uuid(params[:id])
      render text: "Page not found", status: 404
      # render text: params.inspect 
    end
    @courses = @student.courses
  end

  # /students/new GET
  def new
    @student = Student.new
    respond_to do |format|
      format.js { render :partial => "student_form", :status => :ok, content_type: 'text/html' }
      format.html
    end
  end

  # /students/1/edit GET
  def edit
    @student = Student.find_by_uuid(params[:id])
    @courses = Course.all - @student.courses
  end

  # /students/1 PUT
  def update
    student = Student.find_by_uuid(params[:id])
    student.name = params[:student][:name]
    student.email = params[:student][:email]

    selected = params[:selected_courses] 
    selected.each { |key, value|
      if value.to_i == 1
        student.courses << Course.find_by_uuid(key)
      end
    }
    respond_to do |format|
      if student.save 
        format.html { redirect_to :action => "show" }
      else 
        format.html { render text: "#{student.errors.first}" }
      end
    end
  end

  # /students/1 DELETE
  def destroy
    @student.find_by_uuid(params[:id])
  end

end

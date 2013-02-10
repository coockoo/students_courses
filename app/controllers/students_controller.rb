class StudentsController < ApplicationController
  
  # /students GET
  def index
    @students = Student.all
  end

  # /students POST
  def create
    @student = Student.create(params[:student])
    render text: "#{@student.id}: #{@student.name}: #{@student.email}"
  end

  # /students/1 GET
  def show
    @student = Student.find_by_id(params[:id])
  end

  # /students/new GET
  def new
  end

  # /students/1/edit GET
  def edit
  end

  # /students/1 PUT
  def update
  end

  # /students/1 DELETE
  def destroy
  end

end

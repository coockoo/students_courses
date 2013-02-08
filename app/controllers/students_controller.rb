class StudentsController < ApplicationController
  
  def index
    @students = Student.all
    render text: @students.map { |i| "#{i.name} -- #{i.email}" }.join("<br/>")
  end

  def create
    @student = Student.create(params[:student])
    render text: "#{@student.id}: #{@student.name}: #{@student.email}"
  end

end

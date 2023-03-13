class Api::V1::StudentsController < ApplicationController

  def index
    render json: StudentSerializer.new(Student.all)
  end

  def show
    render json: StudentSerializer.new(Student.find(params[:id]))
  end
end

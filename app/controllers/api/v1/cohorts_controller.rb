class Api::V1::CohortsController < ApplicationController
  def show
    render json: CohortSerializer.new(Cohort.find(params[:id]))
  end
end

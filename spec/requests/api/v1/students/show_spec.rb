require 'rails_helper'

RSpec.describe 'Api::V1::Students', type: :request do
  describe 'GET /show' do
    it 'can return a specific student' do
      cohort = create(:cohort)
      students = create_list(:student, 25, cohort: cohort)

      get api_v1_student_path(students[0])

      expect(response).to be_successful
      specific_student = JSON.parse(response.body, symbolize_names: true)
      expect(students[0].id).to eq(specific_student[:data][:id].to_i)

      get api_v1_student_path(students[2])
      next_student = JSON.parse(response.body, symbolize_names: true)
      expect(students[2].id).to eq(next_student[:data][:id].to_i)
    end
  end
end
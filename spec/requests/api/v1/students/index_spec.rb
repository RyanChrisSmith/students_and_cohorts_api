require 'rails_helper'

RSpec.describe 'Api::V1::Students', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get api_v1_students_path
      expect(response).to have_http_status(:success)
    end

    it 'gets all students' do
      cohort = create(:cohort)
      database_cohort = create_list(:student, 25, cohort: cohort)

      get api_v1_students_path

      students = JSON.parse(response.body, symbolize_names: true)

      expect(students[:data].count).to eq 25

      students[:data].each do |student|
        expect(student).to have_key(:id)
        expect(student[:id]).to be_a String

        expect(student).to have_key(:type)
        expect(student[:type]).to be_a String

        expect(student).to have_key(:attributes)
        expect(student[:attributes].count).to eq 7

        expect(student[:attributes]).to have_key(:first_name)
        expect(student[:attributes][:first_name]).to be_a String

        expect(student[:attributes]).to have_key(:last_name)
        expect(student[:attributes][:last_name]).to be_a String

        expect(student[:attributes]).to have_key(:preferred_name)
        expect(student[:attributes][:preferred_name]).to be_a String

        expect(student[:attributes]).to have_key(:pronouns)
        expect(student[:attributes][:pronouns]).to be_a String

        expect(student[:attributes]).to have_key(:email)
        expect(student[:attributes][:email]).to be_a String

        expect(student[:attributes]).to have_key(:github_username)
        expect(student[:attributes][:github_username]).to be_a String

        expect(student[:attributes]).to have_key(:slack_username)
        expect(student[:attributes][:slack_username]).to be_a String

        expect(student[:attributes]).to_not have_key(:cohort_id)
        expect(database_cohort.first.cohort_id).to eq(cohort.id)
      end
    end
  end
end

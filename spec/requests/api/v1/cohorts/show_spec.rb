require 'rails_helper'

RSpec.describe 'Api::V1::Cohorts', type: :request do
  describe 'GET /cohorts/:id' do
    it 'will retreive a specific cohort' do
      cohort = create(:cohort)
      db_students = create_list(:student, 25, cohort: cohort)

      get api_v1_cohort_path(cohort)

      expect(response).to be_successful
      returned_cohort = JSON.parse(response.body, symbolize_names: true)

      expect(cohort.id).to eq(returned_cohort[:data][:id].to_i)
      result = returned_cohort[:data]

      expect(result).to have_key(:id)
      expect(result[:id]).to be_a String

      expect(result).to have_key(:type)
      expect(result[:type]).to be_a String

      expect(result).to have_key(:attributes)
      expect(result[:attributes].count).to eq 5

      expect(result[:attributes]).to have_key(:name)
      expect(result[:attributes][:name]).to be_a String

      expect(result[:attributes]).to have_key(:start_date)
      expect(result[:attributes][:start_date]).to be_a String

      expect(result[:attributes]).to have_key(:graduation_date)
      expect(result[:attributes][:graduation_date]).to be_a String

      expect(result[:attributes]).to have_key(:number_of_students)
      expect(result[:attributes][:number_of_students]).to eq(db_students.count)

      expect(result[:attributes]).to have_key(:status)
      expect(result[:attributes][:status]).to eq('graduated')
    end

    it 'will return a cohort that is currently in school' do
      cohort = Cohort.create!(name: '2301BE', start_date: '2023-01-05', graduation_date: '2023-10-25')
      create_list(:student, 20, cohort: cohort)

      get api_v1_cohort_path(cohort)

      expect(response).to be_successful
      returned_cohort = JSON.parse(response.body, symbolize_names: true)

      expect(cohort.id).to eq(returned_cohort[:data][:id].to_i)
      result = returned_cohort[:data]

      expect(result[:attributes][:status]).to eq('current')
    end

    it 'will return a cohort that is a future cohort in school' do
      cohort = Cohort.create!(name: '2310BE', start_date: '2023-10-05', graduation_date: '2024-06-25')
      create_list(:student, 20, cohort: cohort)

      get api_v1_cohort_path(cohort)

      expect(response).to be_successful
      returned_cohort = JSON.parse(response.body, symbolize_names: true)

      expect(cohort.id).to eq(returned_cohort[:data][:id].to_i)
      result = returned_cohort[:data]

      expect(result[:attributes][:status]).to eq('future')
    end
  end
end
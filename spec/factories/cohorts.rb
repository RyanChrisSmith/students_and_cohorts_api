FactoryBot.define do
  COHORT = ['2207 BE', '2203 FE', '2205 BE', '2109 FE']
  factory :cohort do
    name { COHORT.sample(1).join('')}
    start_date { Date.parse('20220705') }
    graduation_date { Date.parse('20230119') }
  end
end

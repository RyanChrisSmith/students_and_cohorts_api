FactoryBot.define do
  COHORT = ['2107 BE', '2103 FE', '2105 BE', '2009 FE']
  factory :cohort do
    name { COHORT.sample(1).join('')}
    start_date { Date.parse('20220705') }
    graduation_date { Date.parse('20230119') }
  end
end

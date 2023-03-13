class CohortSerializer
  include JSONAPI::Serializer
  attributes :name, :start_date, :graduation_date

  attributes :number_of_students do |object|
    object.students.count
  end

  attributes :status
end

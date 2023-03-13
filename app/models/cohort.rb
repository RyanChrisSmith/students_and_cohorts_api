class Cohort < ApplicationRecord 
  has_many :students

  validates :name, uniqueness: true, presence: true
  validates_presence_of :start_date, :graduation_date


  def status
    if Date.today < start_date
      'future'
    elsif Date.today > start_date && Date.today < graduation_date
      'current'
    else
      'graduated'
    end
  end
end 
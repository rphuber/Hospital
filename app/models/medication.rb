class Medication < ActiveRecord::Base

  has_many :patient_medications
  has_many :medications, through: :patient_medications

end

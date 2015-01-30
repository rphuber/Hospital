class Facility < ActiveRecord::Base

  has_many :facility_patients
  has_many :patients, through: :facility_patients

  has_many  :doctors, as: :doctorable

end

class Patient < ActiveRecord::Base
  
  has_many :facility_patients
  has_many :facilities, through: :facility_patients
  
  has_many :patient_medications
  has_many :medications, through: :patient_medications

  has_many  :doctors, as: :doctorable

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :dob, presence:true
  validates :symptoms, presence:true
  validates :gender, presence:true
  validates :blood_type, presence:true
  
  BT_OPTIONS = [
    ["O+", "O+"],
    ["O-", "O-"],
    ["A+", "A+"],
    ["A-", "A-"],
    ["B+", "B+"],
    ["B-", "B-"],
    ["AB+", "AB+"],
    ["AB-", "AB-"]
  ]
end

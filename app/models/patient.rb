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

  include Workflow
  workflow do
    state :waiting_room do
      event :check_in, transitions_to: :checked_in
    end

    state :checked_in do
      event :see_doctor, transitions_to: :with_doctor
      event :get_xray, transitions_to: :in_xray
      event :enter_surgery, transitions_to: :in_surgery
    end

    state :with_doctor do
      event :get_xray, transitions_to: :in_xray
      event :enter_surgery, transitions_to: :in_surgery
      event :check_out, transitions_to: :checked_out
    end

    state :in_xray do
      event :see_doctor, transitions_to: :with_doctor
      event :enter_surgery, transitions_to: :in_surgery
      event :check_out, transitions_to: :checked_out
    end

    state :in_surgery do
      event :get_xray, transitions_to: :in_xray
      event :see_doctor, transitions_to: :with_doctor
      event :check_out, transitions_to: :checked_out
    end

    state :checked_out do
      event :pay, transitions_to: :paid_out
    end

    state :paid_out

  end
end

class Patient < ActiveRecord::Base
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

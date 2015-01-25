class Facility < ActiveRecord::Base

  has_many :patients, dependent: :destroy

end

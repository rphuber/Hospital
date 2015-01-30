class CreateFacilityPatients < ActiveRecord::Migration
  def change
    create_table :facility_patients do |t|
      t.integer :facility_id
      t.integer :patient_id
      t.timestamps null: false
    end
  end
end

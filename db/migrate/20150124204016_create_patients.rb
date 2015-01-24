class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :symptoms
      t.string :gender
      t.string :blood_type
      t.timestamps null: false
    end
  end
end

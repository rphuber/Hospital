class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.integer :dosage
      t.string :frequency
      t.timestamps null: false
    end
  end
end

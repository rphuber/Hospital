class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.text :name
      t.integer :commentable_id
      t.string :commentable_type
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end

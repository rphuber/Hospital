class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.text :first_name
      t.text :last_name
      t.integer :commentable_id
      t.string :commentable_type
    end
  end
end

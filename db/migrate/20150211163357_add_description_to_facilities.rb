class AddDescriptionToFacilities < ActiveRecord::Migration
  def change
    add_column :facilities, :description, :string
  end
end

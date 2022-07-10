class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.integer :BuildingID
      t.string :InformationKey
      t.text :Value
      # t.date :information_key   not sure wtf this should me
    end
  end

end

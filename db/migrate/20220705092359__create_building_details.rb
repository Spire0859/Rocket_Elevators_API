class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings_details do |t|
      t.int :buildingId
      # t.date :information_key   not sure wtf this shouold me
  end
end

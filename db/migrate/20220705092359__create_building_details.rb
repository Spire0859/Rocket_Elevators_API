class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings_details do |t|
      t.int :buildingId
      t.string :information_key
      t.text :value
      # t.date :information_key   not sure wtf this should me
  end

  add_index :settings, :key, :unique => true

end


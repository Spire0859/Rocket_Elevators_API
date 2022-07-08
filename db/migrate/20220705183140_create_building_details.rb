class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings_details do |t|
      t.integer :buildingId
      t.string :information_key
      t.text :value
      # t.date :information_key   not sure wtf this should me
<<<<<<< HEAD
=======
    end
>>>>>>> ad38ccf2e699f532343228085623f5fd26032065
  end
end

<<<<<<< HEAD
end
=======
>>>>>>> ad38ccf2e699f532343228085623f5fd26032065

class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings_details do |t|
      t.integer :buildingId
      t.string :information_key
      t.text :value
      # t.date :information_key   not sure wtf this should me
<<<<<<< HEAD
  end

end

=======
     end
<<<<<<< HEAD

    end
<<<<<<< HEAD

=======
    end
=======
>>>>>>> cfc10a44b732e30b7c8c5f8edf5c8c2b3068b9f3
>>>>>>> 4d6a87e7870aa01c6fd4ac30115b1ee37eb40e79
end
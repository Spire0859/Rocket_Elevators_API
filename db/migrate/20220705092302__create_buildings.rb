class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
        t.int :CustomerId
        t.date :address 
        t.string :full_name_building_admin
        t.string :email_building_admin
        t.string :phone_building_admin
        t.text :full_name_technical_authority
        t.bigint :phone_technical_authority
        t.text :email_technical_authority
    end
  end
end

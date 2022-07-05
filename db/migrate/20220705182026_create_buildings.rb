class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
        t.integer :CustomerId
        t.string :address 
        t.string :full_name_building_admin
        t.string :email_building_admin
        t.bigint :phone_building_admin
        t.string :full_name_technical_authority
        t.bigint :phone_technical_authority
        t.string :email_technical_authority
        t.belongs_to :customer
    end
  end
end

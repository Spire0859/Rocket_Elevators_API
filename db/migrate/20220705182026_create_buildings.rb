class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.bigint :customerId, null: false
      t.bigint :address, null: false
      t.string :full_name_building_admin, null: false
      t.string :email_building_admin, null: false
      t.string :phone_building_admin, null: false
      t.string :full_name_technical_authority, null: false
      t.string :email_technical_authority, null: false
      t.string :phone_technical_authority, null: false
      t.timestamps
    end
  end
end
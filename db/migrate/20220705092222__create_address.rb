class CreateAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.string :address_type
      t.string :status  
      t.string :entity
      t.string :Number_street
      t.string :apartment
      t.string :city
      t.int :postal_code
      t.text :country
      t.text :notes
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_type
      t.string :status  
      t.string :entity
      t.string :Number_street
      t.string :apartment
      t.string :city
      t.integer :postal_code
      t.text :country
      t.text :notes
      t.belongs_to :customer
      t.belongs_to :building
      end
  end
end

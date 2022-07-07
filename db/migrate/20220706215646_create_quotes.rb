class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
        t.string :building_type
        t.integer :number_apartments
        t.integer :number_floors
        t.integer :number_elevators
        t.integer :number_occupants
        t.string :company_name
        t.string :email
        t.timestamps
      end
    end
end

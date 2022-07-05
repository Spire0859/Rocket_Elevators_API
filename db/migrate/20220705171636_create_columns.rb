class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.integer :columnId
      t.bigint :serial_number
      t.string :model  
      t.string :type 
      t.string :information
      t.text :notes
      t.belongs_to :battery
    end
  end
end

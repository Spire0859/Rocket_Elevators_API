class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.int :batteryId
      t.string :type
      t.string :status
      t.date :date_commissioning
      t.date :date_last_inspection
      t.string :certificate_of_operations
      t.string :information
      t.text :notes
    end
  end
end

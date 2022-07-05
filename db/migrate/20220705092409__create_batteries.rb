class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.int :BuildingId
      t.string :type
      t.string :status
      t.int :EmployeeId
      t.date :date_commissioning
      t.date :date_last_inspection
      t.string :certificate_of_operations
      t.string :information
      t.text :notes
      t.belongs_to :building
      t.belongs_to :employee
  end
end

class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |a|
      a.string :interventionDateStart, null: false
      a.string :interventionDateEnd, null: false
      a.string :result, null: false
      a.string :report
      a.string :status, null: false
      a.belongs_to :employee
      a.belongs_to :building
      a.belongs_to :battery
      a.belongs_to :column
      a.belongs_to :elevator
    end
  end
end

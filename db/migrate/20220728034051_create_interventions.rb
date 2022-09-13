class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |a|
      a.string :interventionDateStart, default:0
      a.string :interventionDateEnd
      a.string :result, default: "incomplete"
      a.string :report
      a.string :status, default: "pending"
      a.belongs_to :employee
      a.belongs_to :building
      a.belongs_to :battery
      a.belongs_to :column
      a.belongs_to :elevator
    end
  end
end

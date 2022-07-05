 class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :lastName
      t.string :firstNname
      t.string :title
      t.belongs_to :user
    end
  end
end 

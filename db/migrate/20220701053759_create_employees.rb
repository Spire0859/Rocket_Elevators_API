 class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.references :user,
      t.bigint "id"
      t.string "lastName"
      t.string "firstNname"
      t.string "title"
    end
 end
end 

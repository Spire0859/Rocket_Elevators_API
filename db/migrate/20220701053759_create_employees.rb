class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees, id: false do |t|
      t.integer :id, primary_key: true, null: false
      t.string :firstNname, null: false
      t.string :lastName, null: false
      t.string :title, null: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
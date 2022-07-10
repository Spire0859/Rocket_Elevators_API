class AddColumnsToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :no_app, :integer
    add_column :quotes, :no_floor, :integer
    add_column :quotes, :no_basements, :integer
    add_column :quotes, :no_businesses, :integer
    add_column :quotes, :no_parking, :integer
    add_column :quotes, :no_elevators, :integer
    add_column :quotes, :no_companies, :integer
    add_column :quotes, :no_occupants, :integer
    add_column :quotes, :no_hours, :integer
  end
end

class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :userId
      t.date :created_at
      t.string :company_name
      t.string :Number_street
      t.string :full_name
      t.string :phone
      t.int :email
      t.text :company_description
      t.text :full_name_technical_authority
      t.text :phone_technical_authority
      t.text :email_technical_authority_manager 
    end
  end
end

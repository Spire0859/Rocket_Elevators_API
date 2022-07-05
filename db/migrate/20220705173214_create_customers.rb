class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :userId
      t.date :created_at
      t.string :company_name
      t.string :address 
      t.string :full_name
      t.bigint :phone
      t.string :email
      t.text :company_description
      t.text :full_name_technical_authority
      t.bigint :phone_technical_authority
      t.text :email_technical_authority_manager 
      t.belongs_to :user
    end
  end
end

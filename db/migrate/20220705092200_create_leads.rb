class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :company_name
      t.string :email
      t.bigint :phone
      t.string :porject_name
      t.string :project_description
      t.string :department
      t.text :message
      t.text :attached_file
      t.date :date
      t.belongs_to :user
    end
  end
end

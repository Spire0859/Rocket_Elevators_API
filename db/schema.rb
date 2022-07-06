# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.
<<<<<<< HEAD

ActiveRecord::Schema.define(version: 2022_07_05_183140) do

=======
ActiveRecord::Schema.define(version: 2022_07_05_182222) do
>>>>>>> 4d6a87e7870aa01c6fd4ac30115b1ee37eb40e79
  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "address_type"
    t.string "status"
    t.string "entity"
    t.string "Number_street"
    t.string "apartment"
    t.string "city"
    t.integer "postal_code"
    t.text "country"
    t.text "notes"
    t.bigint "customer_id"
    t.bigint "building_id"
    t.index ["building_id"], name: "index_addresses_on_building_id"
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end
  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "buildingId"
    t.string "type"
    t.string "status"
    t.integer "EmployeeId"
    t.date "date_commissioning"
    t.date "date_last_inspection"
    t.string "certificate_of_operations"
    t.string "information"
    t.text "notes"
    t.bigint "building_id"
    t.bigint "employee_id"
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end
  create_table "building_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "CustomerId"
    t.string "address"
    t.string "full_name_building_admin"
    t.string "email_building_admin"
    t.bigint "phone_building_admin"
    t.string "full_name_technical_authority"
    t.bigint "phone_technical_authority"
    t.string "email_technical_authority"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end
<<<<<<< HEAD

  create_table "buildings_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
=======
  create_table "building_details" options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
>>>>>>> 4d6a87e7870aa01c6fd4ac30115b1ee37eb40e79
    t.integer "buildingId"
    t.string "information_key"
    t.text "value"
  end
<<<<<<< HEAD

=======
>>>>>>> 4d6a87e7870aa01c6fd4ac30115b1ee37eb40e79
  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "columnId"
    t.bigint "serial_number"
    t.string "model"
    t.string "type"
    t.string "information"
    t.text "notes"
    t.bigint "battery_id"
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end
  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "userId"
    t.date "created_at"
    t.string "company_name"
    t.string "address"
    t.string "full_name"
    t.bigint "phone"
    t.string "email"
    t.text "company_description"
    t.text "full_name_technical_authority"
    t.bigint "phone_technical_authority"
    t.text "email_technical_authority_manager"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end
  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "columnId"
    t.bigint "serial_number"
    t.string "model"
    t.string "type"
    t.string "information"
    t.text "notes"
    t.bigint "column_id"
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end
  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.string "lastName"
    t.string "firstNname"
    t.string "title"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end
  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "company_name"
    t.string "email"
    t.bigint "phone"
    t.string "porject_name"
    t.string "project_description"
    t.string "department"
    t.text "message"
    t.text "attached_file"
    t.date "date"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_leads_on_user_id"
  end
  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "building_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "employee", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
  add_foreign_key "employees", "users"
end
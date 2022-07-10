require "faker"
require 'json'
file = File.read('lib/assets/addresses-us-250.min.json')
data_hash = JSON.parse(file)

# Leads.delete_all
# Leads.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Elevators.delete_all
# Elevators.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Columns.delete_all
# Columns.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Batteries.delete_all
# Batteries.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Addresses.delete_all
# Addresses.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Buildings.delete_all
# Buildings.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Customers.delete_all
# Customers.connection.execute('ALTER TABLE customers AUTO_INCREMENT = 1')

x2thez = User.create!(email: 'mathieu.houde@codeboxx.biz' ,password: '123456')

Employee.create!(
    firstNname: 'tanim', 
    lastName: 'bengali',
    title: 'leagueIsGreat', 
    user_id: x2thez.id
    )

y = Customer.create!(
        user_id: x2thez.id,
        dateCreation: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
        created_at: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
        companyName: Faker::Company.name,
        fullName: Faker::Name.name,
        contactPhone: Faker::Config.locale = 'en-CA',
        email: Faker::Internet.email,
        description: Faker::Lorem.sentence,
        fullNameTechnicalAuthority: Faker::Name.name,
        technicalAuthorityPhone: Faker::Config.locale = 'en-CA',
        technicalAuthorityEmail: Faker::Internet.email
        )

b = Building.create!(
        customer_id: y.id,
        addressOfBuilding: Faker::Address.street_name,
        full_name_building_admin: Faker::Name.name,
        email_building_admin: Faker::Internet.email,
        phone_building_admin: Faker::Config.locale = 'en-CA',
        full_name_technical_authority: Faker::Name.name,
        phone_technical_authority: Faker::Config.locale = 'en-CA',
        email_technical_authority: Faker::Internet.email
            ) 




# for i in 0..199 do
#     address = data_hash["addresses"][i]
#     if address["city"].nil?
#         city = "N/A"
#     else
#         city = address["city"]
#     end

#     Address.create!(
#         address_type: ['buisness', 'billing', 'home', 'shipping'].sample,
#         status: ['active', 'inactive'].sample,
#         entity: ['building', 'customer'].sample,
#         :numberAndStreet => address["address1"],
#         suiteOrApartment: "",
#         :city => city,
#         :postal_code => address["postalCode"],
#         country: "United States",
#         notes: ""
#         )
# end

# 10.times do |i|
#     Customer.create!(
#         userId: "",
#         dateCreation: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
#         companyName: Faker::Company.name,
#         :addressId => i + 1,
#         fullName: Faker::Name.name,
#         contactPhone: Faker::Config.locale = 'en-CA',
#         email: Faker::Internet.email,
#         description: Faker::Lorem.sentence,
#         fullNameTechnicalAuthority: Faker::Name.name,
#         technicalAuthorityPhone: Faker::Config.locale = 'en-CA',
#         technicalAuthorityEmail: Faker::Internet.email
#         )
# end

# 10.times do |i|
#     Building.create!(
#         customer_id:"" ,
#         :addressOfBuilding => i + 1,
#         full_name_building_admin: Faker::Name.name,
#         email_building_admin: Faker::Internet.email,
#         phone_building_admin: Faker::Config.locale = 'en-CA',
#         full_name_technical_authority: Faker::Name.name,
#         email_technical_authority: Faker::Internet.email,
#         phone_technical_authority: Faker::Config.locale = 'en-CA'
#         )
# end

10.times do
    Building_Detail.create!(
        BuildingID: Faker::Number.number(digits: 5),
        InformationKey: Faker::Lorem.sentence,
        Value: Faker::Lorem.sentence
        )
end

# 10.times do
o = Batterie.create!(
        building_id: b.id,
        types: ['residential', 'commercial', 'corporate', 'hybrid'].sample,
        status: Faker::Lorem.word,
        EmployeeId: Faker::Number.number(digits: 5),
        date_commissioning: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
        date_last_inspection: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
        certificate_of_operations: Faker::Lorem.sentence,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence
        )
# end

# 10.times do
    Column.create!(
        battery_id: o.id,
        numberFloorServed: Faker::Number.number(digits: 10),
        model: Faker::Lorem.word,
        types: ['residential', 'commercial', 'corporate', 'hybrid'].sample,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence
        )
# end

10.times do
    Elevator.create!(
        columnId: "",
        serial_number: Faker::Number.number(digits: 10),
        companyName: Faker::Company.name,
        model:Faker::Lorem.word,
        fullName: Faker::Name.name,
        email: Faker::Internet.email,
        dateCommissioning: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
        types: ['residential', 'commercial', 'corporate', 'hybrid'].sample,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence
        )
end

10.times do
    Lead.create!(
        fullNameContact: Faker::Name.name,
        companyName: Faker::Company.name,
        email: Faker::Internet.email,
        phoneNumber: Faker::Config.locale = 'en-CA',
        nameProject: Faker::Lorem.word,
        descriptionProject: Faker::Lorem.sentence,
        department: Faker::Lorem.word,
        message: Faker::Lorem.sentence,
        file: Faker::Lorem.word,
        date: Faker::Date.between(from: '2022-01-01', to: '2022-12-31')
    )
end


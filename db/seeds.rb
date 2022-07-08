# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongsuser_ide the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# id = 1
# type = ['residential', 'commercial', 'corporate', 'hybrid']
# 100.times do
#     Quotes.create([{
#         id: id,
#         type_building: 'hybrid',
#         numApartment: Faker::Number.between(from: 10, to: 500),
#         numFloor: Faker::Number.between(from: 1, to: 80),
#         numOccupant: Faker::Number.between(from: 1, to: 80),
#         numElevator: Faker::Number.between(from: 1, to: 30),
#         companyName: Faker::Company.name,
#         email: Faker::Internet.email,
#         created_at: Faker::Date.between(from: '2019-01-01', to: '2022-10-01')
#         }])
#     id = id + 1
# end 
# User.create(email: 'mathieu.houde@codeboxx.biz',)
# User.create(email: 'patrick.thibault@codeboxx.biz',)
# User.create(email: 'francis.patry-jessop@codeboxx.biz',)
# User.create(email: 'davuser_id.amyot@codeboxx.biz',)
# User.create(email: 'marie-eve.goupil@codeboxx.biz',)
# User.create(email: 'francois.boivin@codeboxx.biz',)
# User.create(email: 'timothy.wever@codeboxx.biz',)
# User.create(email: 'kiril.kleinerman@codeboxx.biz',)
# User.create(email: 'felicia.hartono@codeboxx.biz',)
# User.create(email: 'eileen.ai@codeboxx.biz',)
# # # This file should contain all the record creation needed to seed the database with its default values.
# # # The data can then be loaded with the rails db:seed command (or created alongsuser_ide the database with db:setup).
# # #
# # # Examples:
# # #
# # #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# # #   Character.create(name: 'Luke', movie: movies.first)

require "faker"



# # # User.create(email: 'mathieu.houde@codeboxx.biz',)
# # # User.create(email: 'patrick.thibault@codeboxx.biz',)
# # # User.create(email: 'francis.patry-jessop@codeboxx.biz',)
# # # User.create(email: 'davuser_id.amyot@codeboxx.biz',)
# # # User.create(email: 'marie-eve.goupil@codeboxx.biz',)
# # # User.create(email: 'francois.boivin@codeboxx.biz',)
# # # User.create(email: 'timothy.wever@codeboxx.biz',)
# # # User.create(email: 'kiril.kleinerman@codeboxx.biz',)
# # # User.create(email: 'felicia.hartono@codeboxx.biz',)
# # # User.create(email: 'eileen.ai@codeboxx.biz',)



# users = [
    
#     {email: 'mathieu.houde@codeboxx.biz' ,password: '123456' ,employee: true},
#     {email: 'patrick.thibault@codeboxx.biz',password: '123456',employee: true},
#     {email: 'francis.patry-jessop@codeboxx.biz',password: '123456',employee: true},
#     {email: 'david.amyot@codeboxx.biz',password: '123456',employee: true},
#     {email: 'marie-eve.goupil@codeboxx.biz',password: '123456',employee: true},
#     {email: 'francois.boivin@codeboxx.biz',password: '123456',employee: true},
#     {email: 'timothy.wever@codeboxx.biz',password: '123456',employee: true},
#     {email: 'kiril.kleinerman@codeboxx.biz',password: '123456',employee: true},
#     {email: 'felicia.hartono@codeboxx.biz',password: '123456',employee: true},
#     {email: 'eileen.ai@codeboxx.biz',password: '123456',employee: true},
# ]


# # # employees = [
    
# # #     {user_id: '1' ,lastName: 'Houde' ,firstNname: 'Mathieu' ,title: 'Gopher' },
# # #     {user_id: '2' ,lastName: 'Thibault' ,firstNname: 'Patrick ' ,title: 'Maximalist' },
# # #     {user_id: '3' ,lastName: 'Patry-Jessop' ,firstNname: 'Francis ' ,title: 'Captain' },
# # #     {user_id: '4' ,lastName: 'Amyot' ,firstNname: 'Davuser_id' ,title: 'The Man' },
# # #     {user_id: '5' ,lastName: 'Goupil' ,firstNname: 'Marie-Ève ' ,title: 'AI Master' },
# # #     {user_id: '6' ,lastName: 'Boivin' ,firstNname: 'François' ,title: 'The Tank' },
# # #     {user_id: '7' ,lastName: 'Wever' ,firstNname: 'Timothy' ,title: 'Beard whisperer' },
# # #     {user_id: '8' ,lastName: 'Kleinerman' ,firstNname: 'Kiril' ,title: 'I <3 Winnipeg' },
# # #     {user_id: '9' ,lastName: 'Hartono' ,firstNname: 'Felicia' ,title: 'Scrums are too early' },
# # #     {user_id: '10' ,lastName: 'Ai' ,firstNname: 'Eileen' ,title: 'They really are.' },
# # # ]


# p User.find(1)
# User.create(email: 'mathieu.houde@codeboxx.biz' ,password: '123456' ,employee: true)

<<<<<<< HEAD
# # # users.each do |user|
# # #     this_user = User.where(
# # #         email: user[:email], 
# # #     ).first_or_initialize

# Employee.create(lastName: 'Houde' ,firstNname: 'Mathieu' ,title: 'Gopher', user_id: 1)
# # #     this_user.update!(
# # #         password: user[:password],
# # #         employee: user[:employee],
# # #     )
# # #     this_user.save
# # # end
=======
# users.each do |user|
#     this_user = User.where(
#         email: user[:email], 
#     ).first_or_initialize
>>>>>>> b7362727ff5e55d9afb630f911339964d33fe57d

#     this_user.update!(
#         password: user[:password],
#         employee: user[:employee],
#     )
#     this_user.save
# end
# User.create!(email: 'mathieu.houde@codeboxx.biz' ,password: '123456' ,employee: true)
# # # # c = User.find(1)

# # # p User.find(1)
# # User.create(email: 'mathieu.houde@codeboxx.biz' ,password: '123456' ,employee: true)


    
# # employees.each do |employee|
# #     this_employee = Employee.where(
# #         user_id: employee[:user_id], 
# #     ).first_or_initialize

# #     this_employee.update!(
# #         lastName: employee[:lastName],
# #         firstNname: employee[:firstNname],
# #         title: employee[:title]
# #     )
# #     this_employee.save
# # end
# require 'json'

# file = File.read('address.json')
# data_hash=JSON.parse(file)
# data_hash.keys
# data_hash['Addresses']


# 1.times do
#     Customers.create!(
#         user_id: Faker::Number.number(digits: 5),
#         created_at: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
#         company_name: Faker::Company.name,
#         full_name: Faker::Name.name,
#         phone: Faker::Config.locale = 'en-CA',
#         email: Faker::Internet.email,
#         company_description: Faker::Lorem.sentence,
#         full_name_technical_authority: Faker::Name.name,
#         phone_technical_authority: Faker::Config.locale = 'en-CA',
#         email_technical_authority_manager: Faker::Internet.email
#         )
# end
# require 'json'

# file = File.read('address.json')
# data_hash=JSON.parse(file)
# data_hash.keys
# data_hash['Addresses']

# require 'faker'

# 1.times do
#     Customers.create!(
#         user_id: Faker::Number.number(digits: 5),
#         created_at: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
#         companyName: Faker::company.name,
#         full_name: Faker::Name.name,
#         phone: Faker::Config.locale = 'en-CA',
#         email: Faker::Internet.email,
#         company_description: Faker::Lorem.sentence,
#         full_name_technical_authority: Faker::Name.name,
#         phone_technical_authority: Faker::Config.locale = 'en-CA',
#         email_technical_authority_manager: Faker::Internet.email
#         )
# end

# 1.times do
#     Buildings.create!(
        
#         CustomerId: Faker::Number.number(digits: 5),
#         # address: ..,
#         full_name_building_admin: Faker::Name.name,
#         email_building_admin: Faker::Internet.email,
#         phone_building_admin: Faker::Config.locale = 'en-CA',
#         full_name_technical_authority: Faker::Name.name,
#         phone_technical_authority: Faker::Config.locale = 'en-CA',
#         email_technical_authority: Faker::Internet.email
#         )
# end

# 1.times do 
#     BuildingDetails.create!(
        
#         BuildingID: Faker::Number.number(digits: 5),
#         InformationKey: Faker::Lorem.sentence,
#         Value: Faker::Lorem.sentence
#         )
# end

# 1.times do
#     Batteries.create!(
#         building_id: Faker::Number.number(digits: 5),
#         type: Faker::Types.rb_string(Residential, Commercial, Corporate, Hybrid),
#         status: Faker::Lorem.word,
#         EmployeeId: Faker::Number.number(digits: 5),
#         date_commissioning: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
#         date_last_inspection: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
#         certificate_of_operations: Faker::Lorem.sentence,
#         information: Faker::Lorem.sentence,
#         notes: Faker::Lorem.sentence
#         )
# end

# 1.times do

#     Columns.create!(
#         columnId: Faker::Number.number(digits: 5),
#         serial_number: Faker::Number.number(digits: 10),  
#         model: Faker::Lorem.word,
#         type: Faker::Types.rb_string(Residential, Commercial, Corporate),
#         information: Faker::Lorem.sentence.,
#         notes: Faker::Lorem.sentence
#         )
# end

# 1.times do

#     Elevators.create!(
#         columnId: Faker::Number.number(digits: 5),
#         serial_number: Faker::Number.number(digits: 10),
#         model:Faker::Lorem.word
#         type: Faker::Types.rb_string(Residential, Commercial, Corporate),
#         information: Faker::Lorem.sentence, 
#         notes: Faker::Lorem.sentence
#         )
# end

require 'json'
file = File.read('lib/assets/addresses-us-250.min.json')
data_hash = JSON.parse(file)
Buildings.delete_all
Buildings.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')
Customers.delete_all
Customers.connection.execute('ALTER TABLE customers AUTO_INCREMENT = 1')

for i in 0..199 do
    address = data_hash["addresses"][i]
    if address["city"].nil?
        city = "N/A"
    else
        city = address["city"]
    end

    Addresses.create!(
        typeAddress: "Business",
        status: true,
        entity: "Building",
        :numberAndStreet => address["address1"],
        suiteOrApartment: "",
        :city => city,
        :postalCode => address["postalCode"],
        country: "United States",
        notes: ""
        )
end

require 'faker'
10.times do |i|
    Customers.create!(
        userId: Faker::Number.number(digits: 4),
        dateCreation: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
        companyName: Faker::Company.name,
        :addressId => i + 1,
        fullName: Faker::Name.name,
        contactPhone: Faker::Config.locale = 'en-CA',
        email: Faker::Internet.email,
        description: Faker::Lorem.sentence,
        fullNameTechnicalAuthority: Faker::Name.name,
        technicalAuthorityPhone: Faker::Config.locale = 'en-CA',
        technicalAuthorityEmail: Faker::Internet.email
        )
end

10.times do |i|
    Buildings.create!(
        customerId: Faker::Number.number(digits: 4),
        :addressId => i + 1,
        fullNameAdministrator: Faker::Name.name,
        emailAdministrator: Faker::Internet.email,
        phoneNumberAdministrator: Faker::Config.locale = 'en-CA',
        fullNameTechnicalContact: Faker::Name.name,
        emailTechnicalContact: Faker::Internet.email,
        phoneTechnicalContact: Faker::Config.locale = 'en-CA'
        )
end

1.times do
    Buildings_Details.create!(
        BuildingID: Faker::Number.number(digits: 5),
        InformationKey: Faker::Lorem.sentence,
        Value: Faker::Lorem.sentence
        )
end

10.times do
    Batteries.create!(
        buildingId: Faker::Number.number(digits: 5),
        types: Faker::Types.rb_string(Residential, Commercial, Corporate, Hybrid),
        status: Faker::Lorem.word,
        employeeId: Faker::Number.number(digits: 5),
        dateCommissioning: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
        dateLastInspection: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
        certificateOperations: Faker::Lorem.sentence,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence
        )
end

1.times do
    Columns.create!(
        columnId: Faker::Number.number(digits: 5),
        serial_number: Faker::Number.number(digits: 10),
        model: Faker::Lorem.word,
        type: Faker::Types.rb_string(Residential, Commercial, Corporate),
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence
        )
end

1.times do
    Elevators.create!(
        columnId: Faker::Number.number(digits: 5),
        serial_number: Faker::Number.number(digits: 10),
        model:Faker::Lorem.word,
        type: Faker::Types.rb_string(Residential, Commercial, Corporate),
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence
        )
end

1.times do
    Leads.create!(
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

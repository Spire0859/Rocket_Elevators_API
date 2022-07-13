require "faker"
require 'json'
#require_relative '.env'
file = File.read('lib/assets/addresses-us-250.min.json')
data_hash = JSON.parse(file)

# Lead.delete_all
# Lead.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Elevator.delete_all
# Elevator.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Column.delete_all
# Column.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Batterie.delete_all
# Batterie.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Addresse.delete_all
# Addresse.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Building.delete_all
# Building.connection.execute('ALTER TABLE buildings AUTO_INCREMENT = 1')

# Customer.delete_all
# Customer.connection.execute('ALTER TABLE customers AUTO_INCREMENT = 1')

users = [
    
    {email: 'mathieu.houde@codeboxx.biz' ,password: '123456' ,admin: true},
    {email: 'patrick.thibault@codeboxx.biz',password: '123456',admin: true},
    {email: 'francis.patry-jessop@codeboxx.biz',password: '123456',admin: true},
    {email: 'david.amyot@codeboxx.biz',password: '123456',admin: true},
    {email: 'marie-eve.goupil@codeboxx.biz',password: '123456',admin: true},
    {email: 'francois.boivin@codeboxx.biz',password: '123456',admin: true},
    {email: 'timothy.wever@codeboxx.biz',password: '123456',admin: true},
    {email: 'kiril.kleinerman@codeboxx.biz',password: '123456',admin: true},
    {email: 'felicia.hartono@codeboxx.biz',password: '123456',admin: true},
    {email: 'eileen.ai@codeboxx.biz',password: '123456',admin: true},
]


employees = [
    
    {user_id: '1' ,lastName: 'Houde' ,firstNname: 'Mathieu' ,title: 'Gopher' },
    {user_id: '2' ,lastName: 'Thibault' ,firstNname: 'Patrick ' ,title: 'Maximalist' },
    {user_id: '3' ,lastName: 'Patry-Jessop' ,firstNname: 'Francis ' ,title: 'Captain' },
    {user_id: '4' ,lastName: 'Amyot' ,firstNname: 'David' ,title: 'The Man' },
    {user_id: '5' ,lastName: 'Goupil' ,firstNname: 'Marie-Ève' ,title: 'AI Master' },
    {user_id: '6' ,lastName: 'Boivin' ,firstNname: 'François' ,title: 'The Tank' },
    {user_id: '7' ,lastName: 'Wever' ,firstNname: 'Timothy' ,title: 'Beard whisperer' },
    {user_id: '8' ,lastName: 'Kleinerman' ,firstNname: 'Kiril' ,title: 'I <3 Winnipeg' },
    {user_id: '9' ,lastName: 'Hartono' ,firstNname: 'Felicia' ,title: 'Scrums are too early' },
    {user_id: '10' ,lastName: 'Ai' ,firstNname: 'Eileen' ,title: 'They really are.' },
]

users.each do |user|
    this_user = User.where(
        email: user[:email], 
    ).first_or_initialize

    this_user.update!(
        password: user[:password],
        admin: user[:admin],
    )
    this_user.save
end

Employee.create!(firstNname: 'Mathieu', lastName: 'Houde',title: 'Gopher', user_id: 1 )
Employee.create!(firstNname: 'Patrick', lastName: 'Thibault',title: 'Maximalist', user_id: 2 )
Employee.create!(firstNname: 'Francis', lastName: 'Patry-Jessop',title: 'Captain', user_id: 3 )
Employee.create!(firstNname: 'David', lastName: 'Amyot',title: 'The Man', user_id: 4 )
Employee.create!(firstNname: 'Marie-Ève', lastName: 'Goupil',title: 'AI Master', user_id: 5 )
Employee.create!(firstNname: 'François', lastName: 'Boivin',title: 'The Tank', user_id: 6 )
Employee.create!(firstNname: 'Timothy', lastName: 'Wever',title: 'Beard whisperer', user_id: 7 )
Employee.create!(firstNname: 'Kiril', lastName: 'Kleinerman',title: 'I <3 Winnipeg', user_id: 8 )
Employee.create!(firstNname: 'Felicia', lastName: 'Hartono',title: 'Scrums are too early', user_id: 9 )
Employee.create!(firstNname: 'Eileen', lastName: 'Ai',title: 'They really are.', user_id: 10 )

10.times do

for p in 0..2 do
    addresse = data_hash["addresses"][p]
    if addresse["city"].nil?
        city = "N/A"
    else
        city = addresse["city"]
    end

   i = Addresse.create!(
        address_type: ['buisness', 'billing', 'home', 'shipping'].sample,
        status: ['active', 'inactive'].sample,
        entity: ['building', 'customer'].sample,
        :numberAndStreet => addresse["address1"],
        suiteOrApartment: "",
        :city => city,
        :postal_code => addresse["postalCode"],
        country: "United States",
        notes: ""
        )
 end

usertmp = User.create!(email: Faker::Internet.email ,password: '123456')

y = Customer.create!(
        user_id: usertmp,
        companyHqAddresse: addresse['address1'] + " " + addresse['city'],
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
        addressOfBuilding: i.numberAndStreet + " " + i.city,
        full_name_building_admin: Faker::Name.name,
        email_building_admin: Faker::Internet.email,
        phone_building_admin: Faker::Config.locale = 'en-CA',
        full_name_technical_authority: Faker::Name.name,
        phone_technical_authority: Faker::Config.locale = 'en-CA',
        email_technical_authority: Faker::Internet.email
            ) 

    Building_Detail.create!(
        BuildingID: Faker::Number.number(digits: 5),
        InformationKey: Faker::Lorem.sentence,
        Value: Faker::Lorem.sentence
        )

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

   c = Column.create!(
        batterie_id: o.id,
        numberFloorServed: Faker::Number.number(digits: 10),
        status: Faker::Lorem.word,
        model: Faker::Lorem.word,
        types: ['residential', 'commercial', 'corporate', 'hybrid'].sample,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence
        )

    Elevator.create!(
        column_id: c.id,
        serial_number: Faker::Number.number(digits: 10),
        companyName: Faker::Company.name,
        model:Faker::Lorem.word,
        status: Faker::Lorem.word,
        fullName: Faker::Name.name,
        email: Faker::Internet.email,
        certificateOperations: Faker::Name.name,
        dateCommissioning: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
        dateLastInspection: Faker::Date.between(from: '2022-01-01', to: '2022-12-31'),
        types: ['residential', 'commercial', 'corporate', 'hybrid'].sample,
        information: Faker::Lorem.sentence,
        notes: Faker::Lorem.sentence
        )

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
###########################################################################################################################################################
#for the drop box api
    CODE = ENV["DROPBOX_OAUTH_BEARER"]

    DropboxApi::Client.new(CODE)
   ########################################################################################### 
#     CLIENT_ID = ENV['app_key']
#     CLIENT_SECRET =ENV['app_secret']
#     # 1. Get an authorization URL, requesting offline access type.
#     authenticator = DropboxApi::Authenticator.new(CLIENT_ID, CLIENT_SECRET)
#     authenticator.auth_code.authorize_url(token_access_type: 'offline')

#     # 2. Log into Dropbox and authorize your app. You need to open the
#     #    authorization URL in your browser.

#     # 3. Exchange the authorization code for a reusable access token
#     access_token = authenticator.auth_code.get_token(CODE) #=> #<OAuth2::AccessToken ...>`

#     # You can now use the access token to initialize a DropboxApi::Client, you
#     # should also provide a callback function to store the updated access token
#     # whenever it's refreshed.
#     client = DropboxApi::Client.new(
#     access_token: access_token,
#     on_token_refreshed: lambda { |new_token_hash|
#     # token_hash is a serializable Hash, something like this:
#     # {
#     #   "uid"=>"440",
#     #   "token_type"=>"bearer",
#     #   "scope"=>"account_info.read account_info.write...",
#     #   "account_id"=>"dbid:AABOLtA1rT6rRK4vajKZ...",
#     #   :access_token=>"sl.A5Ez_CBsqJILhDawHlmXSoZEhLZ4nuLFVRs6AJ...",
#     #   :refresh_token=>"iMg4Me_oKYUAAAAAAAAAAapQixCgwfXOxuubCuK_...",
#     #   :expires_at=>1632948328
#     # }
#     SomewhereSafe.save(new_token_hash)
#   }
# )

end


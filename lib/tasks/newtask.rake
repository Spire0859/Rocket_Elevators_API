# require "pg"

# conn = PG.connect(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", dbname: 'MarcosLopez', :user => 'codeboxx', :password => 'Codeboxx1!')

# namespace :dwh do

#     task reset: :environment do
#         Rake::Task["dwh:init"].invoke
#         Rake::Task["dwh:FactQuotes"].invoke
#         Rake::Task["dwh:FactContact"].invoke
#         Rake::Task["dwh:FactElevator"].invoke
#         Rake::Task["dwh:DimCustomers"].invoke
#     end

#     task init: :environment do
#         conn.exec "DROP TABLE IF EXISTS FactQuotes"
#         conn.exec "CREATE TABLE FactQuotes(quoteId INTEGER, created_at DATE, companyName TEXT, email TEXT)"
    
#         conn.exec "DROP TABLE IF EXISTS FactContact"
#         conn.exec "CREATE TABLE FactContact(contactId INTEGER, created_at TEXT, companyName TEXT, email TEXT, projectName TEXT)"
    
#         conn.exec "DROP TABLE IF EXISTS FactElevator"
#         conn.exec "CREATE TABLE FactElevator(serialNumber TEXT, dateOfCom TEXT, buildingId INTEGER, customerId TEXT, buildingCity TEXT)"
    
#         conn.exec "DROP TABLE IF EXISTS DimCustomers"
#         conn.exec "CREATE TABLE DimCustomers(created_at TEXT, companyName TEXT, fullNameCC TEXT, emailCC TEXT, nbElevator INTEGER, customerCity TEXT)"    
#     end

#     task FactQuotes: :environment do
#         Quote.find_each do |q|
#             conn.exec ("INSERT INTO FactQuotes (quoteId, created_at, companyName, email) VALUES ('#{q.id}', '#{q.created_at}', '#{q.companyName.gsub("'", " ")}', '#{q.email}')")
#         end
#     end
    
#     task FactContact: :environment do
#         Lead.find_each do |l|
#             conn.exec ("INSERT INTO FactContact (contactId, created_at, companyName, email, projectName) VALUES ('#{l.id}', '#{l.created_at}', '#{l.companyName.gsub("'", " ")}', '#{l.email}', '#{l.nameProject.gsub("'", " ")}')")
#         end
#     end

#     task FactElevator: :environment do

#         Addresse.find_each do |a|
#             conn.exec ("INSERT INTO FactElevator (buildingCity) VALUES ('#{a.city.gsub("'", " ")}')")
#         end
#                 Customer.find_each do |c|
#                     conn.exec ("INSERT INTO FactElevator (customerId) VALUES ('#{c.id}')")
#                 end
#                     Elevator.find_each do |e|
#                         conn.exec ("INSERT INTO FactElevator (serialNumber, dateOfCom, buildingId) VALUES ('#{e.serial_number}', '#{e.dateCommissioning}', '#{e.column_id}')")
#                     end
#     end

#     task DimCustomers: :environment do
#         Addresse.find_each do |a|
#             conn.exec ("INSERT INTO DimCustomers (customerCity) VALUES ('#{a.city.gsub("'", " ")}')")
#         end
#             Customer.find_each do |c|
#                 conn.exec ("INSERT INTO DimCustomers (created_at, companyName, fullNameCC, emailCC) VALUES ('#{c.dateCreation}', '#{c.companyName.gsub("'", " ")}', '#{c.fullName}', '#{c.email}')")
#             end
#                 Elevator.find_each do |m|
#                     conn.exec ("INSERT INTO DimCustomers (nbElevator) VALUES ('#{m.id}')")
#                 end
#     end

# end

# namespace :qs do
    
#     q_one = "SELECT COUNT(contactId) EXTRACT(MONTH FROM t.created_at) as MonthOfDate
#     FROM FactContact t"
#     q_two = "SELECT COUNT(quoteId) created_at FROM FactQuotes GROUP BY MONTH(created_at)"
#     q_three = "SELECT id, nbElevator FROM DimCustomers"
    
#     task q_one: :environment do
#         conn.exec (q_one)
#     end

#     task q_two: :environment do
#         conn.exec (q_two)
#     end

#     task q_three: :environment do
#         conn.exec (q_three)
#     end

# end
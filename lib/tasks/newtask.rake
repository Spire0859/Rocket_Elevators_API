require "pg"

conn = PG.connect( dbname: 'rocket_elevators_db', :user => 'matias', :password => 'riotgames514' )


# Quotes.all
# Leads.all
# Customer.all
# Elevator.all
# Addresses.all

namespace :dwh do

    task reset: :environment do
        Rake::Task["dwh:init"].invoke
        Rake::Task["dwh:populate"].invoke
    end

    task init: :environment do
        conn.exec "DROP TABLE IF EXISTS FactQuotes"
        conn.exec "CREATE TABLE FactQuotes(quoteId INTEGER PRIMARY KEY, created_at DATE, companyName TEXT, email TEXT, nbElevator INTEGER)"
    
        conn.exec "DROP TABLE IF EXISTS FactContact"
        conn.exec "CREATE TABLE FactContact(contactId INTEGER PRIMARY KEY, created_at TEXT, companyName TEXT, email TEXT, projectName TEXT)"
    
        conn.exec "DROP TABLE IF EXISTS FactElevator"
        conn.exec "CREATE TABLE FactElevator(serialNumber TEXT, dateOfCom DATE, buildingId INTEGER, customerId INTEGER, buildingCity TEXT)"
    
        conn.exec "DROP TABLE IF EXISTS DimCustomers"
        conn.exec "CREATE TABLE DimCustomers(created_at TEXT, companyName TEXT, fullNameCC TEXT, emailCC TEXT, nbElevator INTEGER, customerCity TEXT)"    
    end

    task populate: :environment do
        Addresses.find_each do |a|
            # FactQuotes table 
            Quotes.find_each do |q|
                #puts "quoteId is #{q.id}, creation_date is #{q.created_at}, companyName is #{q.companyName}, email is #{q.email}"
                conn.exec ("INSERT INTO FactQuotes (quoteId, created_at, companyName, email, nbElevator) VALUES ('#{q.id}', '#{q.created_at}', '#{q.companyName.gsub("'", " ")}', '#{q.email}','#{q.numElevator}')")
            end
            # FactContacts
            Leads.find_each do |l|
                #puts "contactId is #{l.id}, creation_date is #{l.created_at}, companyName is #{l.companyName}, email is #{l.email}, projectName is #{l.nameProject}"
                conn.exec ("INSERT INTO FactContact (contactId, created_at, companyName, email, projectName) VALUES ('#{l.id}', '#{l.created_at}', '#{l.companyName.gsub("'", " ")}', '#{l.email}', '#{l.nameProject}')")
            end
            # FactElevator
            Elevators.find_each do |e|
                #puts "contactId is #{l.id}, creation_date is #{l.created_at}, companyName is #{l.companyName}, email is #{l.email}, projectName is #{l.nameProject}"
                conn.exec ("INSERT INTO FactElevator (serialNumber, dateOfCom, buildingId, customerId, buildingCity) VALUES ('#{e.serialNumber}', '#{e.dateCommissioning}', '#{e.columnId}', '#{c.id}', '#{a.city}')")
            end
        # DimCustomers
            Customers.find_each do |c|
                #puts "contactId is #{l.id}, creation_date is #{l.created_at}, companyName is #{l.companyName}, email is #{l.email}, projectName is #{l.nameProject}"
                conn.exec ("INSERT INTO DimCustomers (created_at, companyName, fullNameCC, emailCC, nbElevator, customerCity) VALUES ('#{c.created_at}', '#{e.companyName}', '#{e.fullName}', '#{e.email}', '#{q.numElevator}', '#{a.city}}')")
            end
        end
    end
end
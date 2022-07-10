require "pg"

conn = PG.connect( dbname: 'rocket_elevators_db', :user => 'matias', :password => 'riotgames514' )

namespace :dwh do

    task reset: :environment do
        Rake::Task["dwh:init"].invoke
        Rake::Task["dwh:FactQuotes"].invoke
        Rake::Task["dwh:FactContact"].invoke
        Rake::Task["dwh:FactElevator"].invoke
        Rake::Task["dwh:DimCustomers"].invoke
    end

    task init: :environment do
        conn.exec "DROP TABLE IF EXISTS FactQuotes"
        conn.exec "CREATE TABLE FactQuotes(quoteId INTEGER, created_at DATE, companyName TEXT, email TEXT)"
    
        conn.exec "DROP TABLE IF EXISTS FactContact"
        conn.exec "CREATE TABLE FactContact(contactId INTEGER, created_at TEXT, companyName TEXT, email TEXT, projectName TEXT)"
    
        conn.exec "DROP TABLE IF EXISTS FactElevator"
        conn.exec "CREATE TABLE FactElevator(serialNumber TEXT, dateOfCom TEXT, buildingId INTEGER, customerId TEXT, buildingCity TEXT)"
    
        conn.exec "DROP TABLE IF EXISTS DimCustomers"
        conn.exec "CREATE TABLE DimCustomers(created_at TEXT, companyName TEXT, fullNameCC TEXT, emailCC TEXT, nbElevator INTEGER, customerCity TEXT)"    
    end

    task FactQuotes: :environment do
        Quote.find_each do |q|
            conn.exec ("INSERT INTO FactQuotes (quoteId, created_at, companyName, email) VALUES ('#{q.id}', '#{q.created_at}', '#{q.companyName.gsub("'", " ")}', '#{q.email}')")
        end
    end
    
    task FactContact: :environment do
        Lead.find_each do |l|
            conn.exec ("INSERT INTO FactContact (contactId, created_at, companyName, email, projectName) VALUES ('#{l.id}', '#{l.created_at}', '#{l.companyName.gsub("'", " ")}', '#{l.email}', '#{l.nameProject.gsub("'", " ")}')")
        end
    end

    task FactElevator: :environment do
        Address.find_each do |a|
            conn.exec ("INSERT INTO FactElevator (buildingCity) VALUES ('#{a.city.gsub("'", " ")}')")
        end
                Customer.find_each do |c|
                    conn.exec ("INSERT INTO FactElevator (customerId) VALUES ('#{c.id}')")
                end
                    Elevator.find_each do |e|
                        conn.exec ("INSERT INTO FactElevator (serialNumber, dateOfCom, buildingId) VALUES ('#{e.serial_number}', '#{e.dateCommissioning}', '#{e.column_id}')")
                    end
    end

    task DimCustomers: :environment do
        Address.find_each do |e|
            conn.exec ("INSERT INTO DimCustomers (customerCity) VALUES ('#{a.city.gsub("'", " ")}')")
        end
            Customer.find_each do |c|
                conn.exec ("INSERT INTO DimCustomers (created_at, companyName, fullNameCC, emailCC) VALUES ('#{c.dateCreation}', '#{c.companyName.gsub("'", " ")}', '#{c.fullName}', '#{c.email}')")
            end
    end

endgit pull
require "pg"

conn = PG.connect( dbname: 'rocket_elevators_db', :user => 'matias', :password => 'riotgames514' )
    
    conn.exec "DROP TABLE IF EXISTS FactQuotes"
    conn.exec "CREATE TABLE FactQuotes(quoteId INTEGER PRIMARY KEY, created_at DATE, compagnyName TEXT, email TEXT, nbElevator INTEGER)"

    conn.exec "DROP TABLE IF EXISTS FactContact"
    conn.exec "CREATE TABLE FactContact(ContactId INTEGER PRIMARY KEY, created_at DATE, compagnyName TEXT, email TEXT, ProjectName TEXT)"

    conn.exec "DROP TABLE IF EXISTS FactElevator"
    conn.exec "CREATE TABLE FactElevator(SerialNumber TEXT, DateOfCom DATE, BuildingID INTEGER, CustomerID INTEGER, BuildingCity TEXT)"

    conn.exec "DROP TABLE IF EXISTS DimCustomers"
    conn.exec "CREATE TABLE DimCustomers(created_at DATE, compagnyName TEXT, FullNameCC TEXT, EmailCC TEXT, NbElevator INTEGER, CustomerCity TEXT)"


# Quotes.all
# Leads.all
# Customer.all
# Elevator.all
# Addresses.all


namespace :db do
    desc 'populate db warehouse'
    task :FactQuotes => :environment do
        # FactQuotes table 
        Quotes.find_each do |q|
        put "quoteId is #{q.id}, created_at is #{q.created_at}, compagnyName is #{q.compagnyName}, email is #{q.email}"
        conn.exec ("INSERT INTO FactQuotes (quoteId, created_at, compagnyName, email) VALUES (#{q.id}, #{q.created_at}, #{q.compagnyName}, #{q.email})")

    end
end
end
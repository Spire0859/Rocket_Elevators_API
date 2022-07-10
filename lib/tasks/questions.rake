namespace :questions do
    desc "Gives the result of Question 1"
    q_one = "SELECT COUNT(contactId), created_at FROM FactContact GROUP BY MONTH(created_at);"
    q_two = "SELECT COUNT(quoteId), created_at FROM FactQuotes GROUP BY MONTH(created_at);"
    q_three = "SELECT id, nbElevator FROM DimCustomers;"
    
    task q_one: :environment do
        ActiveRecord::Base.connection.execute(q_one)
    end

    task q_two: :environment do
        ActiveRecord::Base.connection.execute(q_two)
    end

    task q_three: :environment do
        ActiveRecord::Base.connection.execute(q_three)
    end

end
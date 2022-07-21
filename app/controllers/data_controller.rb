require "rubygems"
require "rest_client"
require "json"
require 'aws-sdk-polly'

class DataController < ActionController::Base
    # Your freshdesk domain
    fd_domain = 'rocketelevators-support'

    # It could be either your user name or api_key.
    user_name_or_api_key = 'iohhGOT939hTYz9tk2'

    # If you have given api_key, then it should be x. If you have given user name, it should be password
    password_or_x = 'X'

    api_path = "api/v2/tickets"

    ticket_id = 1

    api_url  = "https://#{fd_domain}.freshdesk.com/#{api_path}/#{ticket_id}"

    site = RestClient::Resource.new(api_url, user_name_or_api_key, password_or_x)

    begin
    response = site.get(:accept=>'application/json')
    puts "response_code: #{response.code} \n response_body: #{response.body} \n"
    rescue RestClient::Exception => exception
    puts "API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id"
    puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
    puts "Response Code: #{exception.response.code} \n Response Body: #{exception.response.body} \n"
    end

    def playbriefing
        user = warden.user.email
        elevatorNum = Elevator.count
        buildingNum = Building.count
        customerNum = Customer.count
        elevatorsMaintenance = 0
        batterieNum =  Batterie.count
        leadNum = Lead.count
        cityNum = Addresse.pluck(:city).uniq.count

        credentials = Aws::Credentials.new('AKIATAAKB5PVDHXSTCYL', 'l/jylKFbiH8DyXP5JxHjifY8nkbLFOCU8qLdz8CI')
        client = Aws::Polly::Client.new(region: 'us-west-2', credentials: credentials)

        tts = "Hello user , #{user}. There are currently #{elevatorNum} 
            elevators deployed in the #{buildingNum} buildings of your #{customerNum} customers.
            Currently, #{elevatorsMaintenance} elevators are not in Running Status and are being serviced.
            You currently have #{leadNum} leads in your contact requests.
            #{batterieNum} Batteries are deployed across #{cityNum} cities"

        x = client.synthesize_speech(output_format: 'mp3',text: tts,voice_id: 'Joanna')  
        
        
       
        mp3_file = 'app/assets/audio/' + "tester" +'.mp3'
        
        IO.copy_stream(x.audio_stream, mp3_file)
    end

end
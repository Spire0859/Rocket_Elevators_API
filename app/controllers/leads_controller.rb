class LeadsController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'rest_client'

  def create 
    @leads = Lead.new(contact_params)
    @leads.date = DateTime.now
    
  if @leads.save
    data  = {
      status: 2, 
      priority: 1,
      subject: "#{@leads.nameProject}",
      email: "#{@leads.email}",
      description: " name: #{@leads.fullNameContact}, " + " company name: #{@leads.companyName}, " + " phone number: #{@leads.phoneNumber}, " + " project description: #{@leads.descriptionProject}, " + " message: #{@leads.message}"
    }

    data_json = JSON.generate(data)
  #  data = JSON.dump({
  #       "description" => @leads.message,
  #       "subject" => @leads.nameProject,
  #       "email" => @leads.email,
  #       "priority" => 1,
  #       "status" =>2,
  #       "cc_emails" => [
  #         "support@rocketelevators-support.freshdesk.com",
  #       ]})

    request = RestClient::Request.execute(
      method: :post,
      url: 'https://rocketelevators-support.freshdesk.com/api/v2/tickets',
      user: "iohhGOT939hTYz9tk2",
      password: 'X',
      payload: data_json,
      headers: {"Content-Type" => 'application/json'}
    )
    
      flash[:notice] = 'Quote created successfully'
      redirect_to pages_quote_url action: :new

          
  end
end
  private
  def contact_params
    params.require(:leads).permit(:fullNameContact, :companyName, :email, :phoneNumber, :nameProject, :descriptionProject, :department, :message, :file) 
  end
end 


#getting all data to send to api

        
  
          # #making api call 

          # uri = URI.parse("https://domain.freshdesk.com/api/v2/tickets/20?include=requester")
          # request = Net::HTTP::Get.new(uri)
          # request.basic_auth("kjMdvajsTYgWGb3T3bDt", "X")
          
          # req_options = {
          #   use_ssl: uri.scheme == "https",
          # }
          
          # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          #   http.request(request)
          # end


          # uri = URI.parse("https://domain.freshdesk.com/api/v2/tickets")
          # request = Net::HTTP::Post.new(uri)
          # request.basic_auth("kjMdvajsTYgWGb3T3bDt", "X")
          # request.content_type = "application/json"
          # request.body = JSON.dump({
          #   "description" => @leads.message,
          #   "subject" => @leads.nameProject,
          #   "email" => @leads.email,
          #   "priority" => 1,
          #   "status" => 2,
          #   "cc_emails" => [
          #     "support@rocketelevators-support.freshdesk.com",
          #   ],
          #   "custom_fields" => {
          #     "category" => "Primary"
          #   }
          # })

          # req_options = {
          #   use_ssl: uri.scheme == "https",
          # }

          # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          #   http.request(request)
          # end

require 'sendgrid-ruby'
require 'net/http'
require 'uri'
require 'json'
require 'rest_client'
class LeadsController < ApplicationController
  def create 
    puts "WHAT THE FUCKa"
    @leads = Lead.new(lead_params)
    @leads.date = DateTime.now
    
    
    if @leads.save
      puts "WHAT THE FUCK"
      # ******************** SENDING NEW TICKET TO FRESHDESK ********************
      data  = {
        status: 2, 
        priority: 1,
        subject: "#{@leads.nameProject}",
        email: "#{@leads.email}",
        description: " name: #{@leads.fullNameContact}, " + " company name: #{@leads.companyName}, " + " phone number: #{@leads.phoneNumber}, " + " project description: #{@leads.descriptionProject}, " + " message: #{@leads.message}"
      }
  
      data_json = JSON.generate(data)

    puts data_json
      
      request = RestClient::Request.execute(
        method: :post,
        url: 'https://rocketelevators-support.freshdesk.com/api/v2/tickets',
        user: 'kURQwg3sV5CeY1MDB3J',
        password: 'X',
        payload: data_json,
        headers: {"Content-Type" => 'application/json'}
      )
      
      flash[:notice] = 'Quote created successfully'
      redirect_to root_path
    end
  end

    


 

  private
    # Use callbacks to share common setup or constraints between actions.
    

    # Only allow a list of trusted parameters through.
    def lead_params
      params.require(:leads).permit(:fullNameContact, :companyName, :email, :phoneNumber, :nameProject, :descriptionProject, :department, :message, :file)
    end

   
  
  end




 


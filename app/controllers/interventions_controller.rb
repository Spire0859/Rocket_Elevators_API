require 'net/http'
require 'uri'
require 'json'
require 'rest_client'

class InterventionsController < ApplicationController
  def interventionsForm
    puts "hi"
  end
    def create 
      @interventions = Intervention.new(intervention_params)
      
      if @interventions.save
        email = User.find(@interventions.employee_id).email
        puts email
        data1  = {
          status: 2, 
          priority: 1,
          subject: "New intervention" + "#{@interventions.employee_id}",
          email: email,
          description: " building_id: #{@interventions.building_id}, " + " battery_id: #{@interventions.battery_id}, " + " column_id: #{@interventions.column_id}, " + " elevator_id: #{@interventions.elevator_id}, " + " report: #{@interventions.report}"
        }
    
        data_json1 = JSON.generate(data1)
  
        
        request1 = RestClient::Request.execute(
          method: :post,
          url: 'https://rocketelevators-support.freshdesk.com/api/v2/tickets',
          user: 'kURQwg3sV5CeY1MDB3J',
          password: 'X',
          payload: data_json1,
          headers: {"Content-Type" => 'application/json'}
        )
        
        flash[:notice] = 'Quote created successfully'
        redirect_to root_path

        else
          redirect_to pages_quote_url
      end
  
  
    end
  
    private
    def intervention_params
      params.require(:interventions).permit(:building_id, :battery_id, :column_id, :elevator_id, :employee_id, :report) 
    end
  end
  


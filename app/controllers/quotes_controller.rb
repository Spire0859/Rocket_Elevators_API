class QuotesController < ApplicationController
  def create 
    @quotes = Quote.new(quote_params)
    
    if @quotes.save
      data  = {
        status: 2, 
        priority: 1,
        subject: "#{@quotes.companyName}",
        email: "#{@quotes.email}",
        description: " building type: #{@quotes.type_building}, " + " number of appartment: #{@quotes.numApartment}, " + " number of floor: #{@quotes.numFloor}, " + " number of elevator: #{@quotes.numElevator}, " + " message: #{@quotes.message}"
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

      flash[:notice] = 'Quote created successfully'
      redirect_to pages_quote_url action: :new
    else
      render :new 
    end
  end

  private
  def quote_params
    params.require(:quotes).permit(:type_building, :numApartment, :numFloor, :numElevator, :numOccupant, :companyName, :email) 
  end
end

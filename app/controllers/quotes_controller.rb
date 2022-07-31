require 'net/http'
require 'uri'
require 'json'
require 'rest_client'

class QuotesController < ApplicationController
  def create 
    @quotes = Quote.new(quote_params)
    
    if @quotes.save

     
      
      
        flash[:notice] = 'Quote created successfully'
        redirect_to pages_quote_url action: :new
  
            
    end


  end

  private
  def quote_params
    params.require(:quotes).permit(:type_building, :numApartment, :numFloor, :numElevator, :numOccupant, :companyName, :email) 
  end
end

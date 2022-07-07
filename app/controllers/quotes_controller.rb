class QuotesController < ApplicationController
    def create 
      @quote = Quote.new(quote_params)
    end
  
    private

    def quote_params
      params.require(:quote).permit(:type_building, :numApartment, :numFloor, :numElevator, :numOccupant, :companyName, :email) 
    end
  end
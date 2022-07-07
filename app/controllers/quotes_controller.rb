class QuotesController < ApplicationController
    def create 
        @quote = Quote.new(quote_params)
        if @quote.save
          flash[:notice] = 'Quote created successfully'
        else
          render :new 
        end
      end
    
      private
      def quote_params
        params.require(:quote).permit(:type_building, :numApartment, :numFloor, :numElevator, :numOccupant, :compagnyName, :email) 
      end
    end
class QuotesController < ApplicationController
<<<<<<< HEAD
  def create 
    @quotes = Quote.new(quote_params)
    if @quotes.save
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
=======
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
>>>>>>> f07c02f4d0423d4eb43fd9a98ef86545b9eae448

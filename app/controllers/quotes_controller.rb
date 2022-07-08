class QuotesController < ApplicationController
  def create 
    @quotes = Quote.new(quote_params)
    
    if @quotes.save
      flash[:notice] = 'Quote created successfully'
      redirect_to pages_quote_url action: :new
    else
      render :new 
    end
<<<<<<< HEAD
    def new
        @quotes = Quote.new
    end
    def create
        @quotes = Quote.new(my_params)
        # @quotes = Quote.new(building_type: "...")
        
        if @quotes.save
            redirect_to @quotes
            render :new
        else
            render :new, status: :unprocessable_entity
        end
    end
    private
    def my_params
        params.require(:quotes).permit(:building_type)
    end
end
=======
  end

  private
  def quote_params
    params.require(:quotes).permit(:type_building, :numApartment, :numFloor, :numElevator, :numOccupant, :companyName, :email) 
  end
end
>>>>>>> 7e508226ba2fcf68d9e48860353ef33fa2dd0f99

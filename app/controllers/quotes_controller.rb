class QuotesController < ApplicationController
    def index
        @quotes = Quote.all
    end
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
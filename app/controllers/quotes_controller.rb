class QuotesController < ApplicationController
    def index
        @quotes = Quote.all
    end
    def new
        @quotes = Quote.new
    end
    def create
        @quotes = Quote.new(my_params)
        if @quotes.save
            #redirect_to @quotes
            render :new
        else
            render :new
        end
    end
    private
    def my_params
        params.require(:quote).permit(:building_type)
    end
end
class InterventionsController < ApplicationController
    def create 
      @interventions = Intervention.new(intervention_params)
      
      if @interventions.save
  
        flash[:notice] = 'Quote created successfully'
        redirect_to pages_quote_url 

        else
          redirect_to root_path
      end
  
  
    end
  
    private
    def intervention_params
      params.require(:interventions).permit(:status) 
    end
  end
  


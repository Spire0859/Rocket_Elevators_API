class LeadsController < ApplicationController
  def create 
    @leads = Lead.new(contact_params)
    @leads.date = DateTime.now
    
  if @leads.save
      flash[:notice] = 'Quote created successfully'
      redirect_to pages_quote_url action: :new
  end
end
  private
  def contact_params
    params.require(:leads).permit(:fullNameContact, :companyName, :email, :phoneNumber, :nameProject, :descriptionProject, :department, :message, :file) 
  end
end 

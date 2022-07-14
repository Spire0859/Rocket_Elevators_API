class LeadsController < ApplicationController
  def create 
    @leads = Lead.new(contact_params)
    @leads.date = DateTime.now
    
    if @leads.save
      flash[:notice] = 'Quote created successfully'
      
      file = @leads.file
      customer = Customer.find_by email: @leads.email
      customerEmail = customer.email
      
      pp customerEmail
      pp @leads.email
      pp @leads.file
      pp (@leads.email == customerEmail).to_s
      pp (@leads.file != "").to_s
      pp "hello"

      if file != "" && @leads.email == customerEmail
        pp "connecting with api"
        dropbox_api()
      elsif not file == ""
        pp "found attchmnt but not a customer so not using api"
      elsif file == ""
        pp "cant find a attchment"
      elsif
        pp file  
      end

      
      
      redirect_to pages_quote_url action: :new
    end
  end
  def dropbox_api
    file = @leads.file
    company = @leads.companyName
    project = @leads.nameProject
    #connects with the api
    client = DropboxApi::Client.new(ENV['DROPBOX_OAUTH_BEARER'])
    #Searches to check if a folder exeist in the name of the companey and project name
    searchResult = client.search("#{company}_#{project}")
    pp searchResult.matches.length
    if searchResult.matches.length == 0
      pp "folder doesnt exist"
      client.create_folder("/Apps/#{company}_#{project}")
      pp "created a new folder"
      client.upload("/Apps/#{company}_#{project}/#{file}",file)
      pp "saved the file to the new foder"
      @leads.email = nil 
      pp "deleted the local copy "
    elsif
      pp "folder exist"
      client.upload("/Apps/#{company}_#{project}/#{file}",file)
      pp "saved the file to the existing folder"
      @leads.email = nil 
      pp "deleted the local copy "
    end
  end
  private
  def contact_params
    params.require(:leads).permit(:fullNameContact, :companyName, :email, :phoneNumber, :nameProject, :descriptionProject, :department, :message, :file) 
  end

end 

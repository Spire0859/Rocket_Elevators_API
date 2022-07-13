require 'oga'

class LeadsController < ApplicationController
  def create 
    @leads = Lead.new(contact_params)
    @leads.date = DateTime.now
    
  if @leads.save
      flash[:notice] = 'Quote created successfully'
      company = @leads.companyName
      project = @leads.nameProject
      file = @leads.file = ""

      
      
       if !@leads.file == ""
        dropbox_api()
      elsif @leads.file == ""
        pp "cant find a attchment"
      end

      def dropbox_api
        #connects with the api
        client = DropboxApi::Client.new(ENV['DROPBOX_OAUTH_BEARER'])
        #Searches to check if a folder exeist in the name of the companey and project name
        searchResult = client.search("/#{company}_#{project}")
        if searchResult.matches.length == 0
          pp "folder doesnt exist"
          client.create_folder("/Apps/#{company}#{project}")
          pp "created a new folder"
          client.upload("/Apps/#{company}#{project}/#{file}",file)
          pp "saved the file to the new foder"
        elsif
          pp "folder exist"
          client.upload("/Apps/#{company}#{project}/#{file}",file)
          pp "saved the file to the existing folder"
        end
      end
      
      redirect_to pages_quote_url action: :new
  end
end
  private
  def contact_params
    params.require(:leads).permit(:fullNameContact, :companyName, :email, :phoneNumber, :nameProject, :descriptionProject, :department, :message, :file) 
  end

end 

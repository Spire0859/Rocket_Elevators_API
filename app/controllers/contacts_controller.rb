class ContactsController < ApplicationController
    def create 
      @contacts = Lead.new(contact_params)
      @contacts.date = DateTime.now

      puts @contacts
      if @contacts.save
        flash[:notice] = 'Quote created successfully'
        redirect_to pages_quote_url   
      
    else
        redirect_to root_path  
      end
   end

    private
    def contact_params
      params.require(:contacts).permit(:fullNameContact, :companyName, :email, :phoneNumber, :nameProject, :descriptionProject, :department, :message, :file) 
    end
end 
  

# #   t.string "fullNameContact", null: false
#   t.string "companyName", null: false
#   t.string "email", null: false
#   t.string "phoneNumber", null: false
#   t.string "nameProject", null: false
#   t.string "descriptionProject", null: false
#   t.string "department", null: false
#   t.string "message", null: false
#   t.binary "file", null: false
#   t.datetime "date", null: false
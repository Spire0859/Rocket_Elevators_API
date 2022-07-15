require 'sendgrid-ruby'
include SendGrid

class LeadsController < ApplicationController
  def create 
    @leads = Lead.new(contact_params)
    @leads.date = DateTime.now
    # ******************** SENDING MESSAGE WITH SENDGRID ********************
    from = Email.new(email: 'razakadegoke@outlook.fr')
    to = Email.new(email: "#{@leads.email}")
    subject = 'Sending with SendGrid is Fun'
    content = Content.new(type: 'text/plain', value: "Greetings #{@leads.fullNameContact} \r\r
      We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project #{@leads.nameProject}.\r
      A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.\r \r
      We’ll Talk soon \r
      The Rocket Team")
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    # ******************** SENDING MESSAGE WITH SENDGRID ********************
    if @leads.save
      redirect_to root_path
    end
  end

  private
  def contact_params
    params.require(:leads).permit(:fullNameContact, :companyName, :email, :phoneNumber, :nameProject, :descriptionProject, :department, :message, :file) 
  end
end 


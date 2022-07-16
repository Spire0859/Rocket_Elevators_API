require 'sendgrid-ruby'
include SendGrid

class LeadsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_lead, only: %i[ show edit update destroy ]
  before_action :must_be_admin, only: :edit

  # GET /leads or /leads.json
  def index
    @leads = Lead.all
    $leadname
    $leademail
    $leadPhone
    $leadcompany
    $leaddescription
    

  require 'net/http'
  require 'uri'
  require 'json'
  require 'rest_client'

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

=======
    
  if @leads.save
    data  = {
      status: 2, 
      priority: 1,
      subject: "#{@leads.nameProject}",
      email: "#{@leads.email}",
      description: " name: #{@leads.fullNameContact}, " + " company name: #{@leads.companyName}, " + " phone number: #{@leads.phoneNumber}, " + " project description: #{@leads.descriptionProject}, " + " message: #{@leads.message}"
    }

    data_json = JSON.generate(data)
  #  data = JSON.dump({
  #       "description" => @leads.message,
  #       "subject" => @leads.nameProject,
  #       "email" => @leads.email,
  #       "priority" => 1,
  #       "status" =>2,
  #       "cc_emails" => [
  #         "support@rocketelevators-support.freshdesk.com",
  #       ]})

    request = RestClient::Request.execute(
      method: :post,
      url: 'https://rocketelevators-support.freshdesk.com/api/v2/tickets',
      user: "iohhGOT939hTYz9tk2",
      password: 'X',
      payload: data_json,
      headers: {"Content-Type" => 'application/json'}
    )
    
      flash[:notice] = 'Quote created successfully'
      redirect_to pages_quote_url action: :new

          

  end

  # GET /leads/1 or /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads or /leads.json
  def create
    @lead = Lead.new(lead_params)
    @lead.date = DateTime.now

    respond_to do |format|
      if @lead.save
        pp "hello"
        checkIfLeadIsCustomerAndConnect()
        format.html { redirect_to lead_url(@lead), notice: "Success!!" }
        # format.json { render :show, status: :created, location: @lead }
      # else
      #   format.html { render :new, status: :unprocessable_entity }
      #   format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to lead_url(@lead), notice: "Lead was successfully updated." }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1 or /leads/1.json
  def destroy
    @lead.destroy

    respond_to do |format|
      format.html { redirect_to leads_url, notice: "Lead was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  ##############################################################################################################################
  def checkIfLeadIsCustomerAndConnect
    file = @lead.file
    customer = Customer.find_by email: @lead.email
    pp customer
    
    # customerEmail = customer.email
    if file != "" &&  customer != nil #@lead.email == customerEmail
      pp "connecting with api"
      dropbox_api()
    else
      pp "didnt connect to api"
    end
  end
  ######################################################################################################################################
  def dropbox_api
    

    fileurl = @lead.file.current_path 
    file = @lead.file
    name = @lead.fullNameContact
    company = @lead.companyName
    
    #connects with the api
    client = DropboxApi::Client.new(ENV['DROPBOX_OAUTH_BEARER'])
    #Searches to check if a folder exeist in the name of the companey and project name
    searchResult = client.search("#{company}")
    
    if searchResult.matches.length == 0
      pp "folder doesnt exist"
      client.create_folder("/Apps/#{company}")
      pp "created a new folder"
      client.upload("/Apps/#{company}/#{name}",fileurl)
      pp "saved the file to the new foder"
      #@leads.email = nil 
      pp "deleted the local copy "
    elsif
      pp "folder exist"
      client.upload("/Apps/#{company}/#{name}",fileurl)
      pp "saved the file to the existing folder"
      #@leads.email = nil 
      pp "deleted the local copy "
    end
  end
##################################################################################################################

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lead_params
      params.require(:lead).permit(:fullNameContact, :companyName, :email, :phoneNumber, :nameProject, :descriptionProject, :department, :message, :file)
    end

    private
    def must_be_admin
    unless current_user && current_user.emp?
      redirect_to root_path, notice: "Some message"
    end
  end

end

end 

#getting all data to send to api

        
  
          # #making api call 

          # uri = URI.parse("https://domain.freshdesk.com/api/v2/tickets/20?include=requester")
          # request = Net::HTTP::Get.new(uri)
          # request.basic_auth("kjMdvajsTYgWGb3T3bDt", "X")
          
          # req_options = {
          #   use_ssl: uri.scheme == "https",
          # }
          
          # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          #   http.request(request)
          # end


          # uri = URI.parse("https://domain.freshdesk.com/api/v2/tickets")
          # request = Net::HTTP::Post.new(uri)
          # request.basic_auth("kjMdvajsTYgWGb3T3bDt", "X")
          # request.content_type = "application/json"
          # request.body = JSON.dump({
          #   "description" => @leads.message,
          #   "subject" => @leads.nameProject,
          #   "email" => @leads.email,
          #   "priority" => 1,
          #   "status" => 2,
          #   "cc_emails" => [
          #     "support@rocketelevators-support.freshdesk.com",
          #   ],
          #   "custom_fields" => {
          #     "category" => "Primary"
          #   }
          # })

          # req_options = {
          #   use_ssl: uri.scheme == "https",
          # }

          # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          #   http.request(request)
          # end

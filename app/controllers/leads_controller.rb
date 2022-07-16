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

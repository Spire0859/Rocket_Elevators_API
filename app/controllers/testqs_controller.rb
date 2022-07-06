class TestqsController < ApplicationController
  before_action :set_testq, only: %i[ show edit update destroy ]

  # GET /testqs or /testqs.json
  def index
    @testqs = Testq.all
  end

  # GET /testqs/1 or /testqs/1.json
  def show
  end

  # GET /testqs/new
  def new
    @testq = Testq.new
  end

  # GET /testqs/1/edit
  def edit
  end

  # POST /testqs or /testqs.json
  def create
    @testq = Testq.new(testq_params)

    respond_to do |format|
      if @testq.save
        format.html { redirect_to testq_url(@testq), notice: "Testq was successfully created." }
        format.json { render :show, status: :created, location: @testq }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @testq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testqs/1 or /testqs/1.json
  def update
    respond_to do |format|
      if @testq.update(testq_params)
        format.html { redirect_to testq_url(@testq), notice: "Testq was successfully updated." }
        format.json { render :show, status: :ok, location: @testq }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @testq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testqs/1 or /testqs/1.json
  def destroy
    @testq.destroy

    respond_to do |format|
      format.html { redirect_to testqs_url, notice: "Testq was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testq
      @testq = Testq.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def testq_params
      params.fetch(:testq, {})
    end
end

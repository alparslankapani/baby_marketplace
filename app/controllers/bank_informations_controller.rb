class BankInformationsController < ApplicationController
  before_action :set_bank_information, only: [:show, :edit, :update, :destroy]

  # GET /bank_informations
  # GET /bank_informations.json
  def index
    @bank_informations = BankInformation.all
  end

  # GET /bank_informations/1
  # GET /bank_informations/1.json
  def show
  end

  # GET /bank_informations/new
  def new
    @bank_information = BankInformation.new
  end

  # GET /bank_informations/1/edit
  def edit
  end

  # POST /bank_informations
  # POST /bank_informations.json
  def create
    @bank_information = BankInformation.new(bank_information_params)

    respond_to do |format|
      if @bank_information.save
        format.html { redirect_to @bank_information, notice: 'Bank information was successfully created.' }
        format.json { render :show, status: :created, location: @bank_information }
      else
        format.html { render :new }
        format.json { render json: @bank_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_informations/1
  # PATCH/PUT /bank_informations/1.json
  def update
    respond_to do |format|
      if @bank_information.update(bank_information_params)
        format.html { redirect_to @bank_information, notice: 'Bank information was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_information }
      else
        format.html { render :edit }
        format.json { render json: @bank_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_informations/1
  # DELETE /bank_informations/1.json
  def destroy
    @bank_information.destroy
    respond_to do |format|
      format.html { redirect_to bank_informations_url, notice: 'Bank information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_information
      @bank_information = BankInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_information_params
      params.require(:bank_information).permit(:bank_name, :bank_account, :user_id, :listing_id)
    end
end

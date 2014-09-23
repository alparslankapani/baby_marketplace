class AdressInformationsController < ApplicationController
  before_action :set_adress_information, only: [:show, :edit, :update, :destroy]

  # GET /adress_informations
  # GET /adress_informations.json
  def index
    @adress_informations = AdressInformation.all
  end

  # GET /adress_informations/1
  # GET /adress_informations/1.json
  def show
  end

  # GET /adress_informations/new
  def new
    @adress_information = AdressInformation.new
  end

  # GET /adress_informations/1/edit
  def edit
  end

  # POST /adress_informations
  # POST /adress_informations.json
  def create
    @adress_information = AdressInformation.new(adress_information_params)

    respond_to do |format|
      if @adress_information.save
        format.html { redirect_to @adress_information, notice: 'Adress information was successfully created.' }
        format.json { render :show, status: :created, location: @adress_information }
      else
        format.html { render :new }
        format.json { render json: @adress_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adress_informations/1
  # PATCH/PUT /adress_informations/1.json
  def update
    respond_to do |format|
      if @adress_information.update(adress_information_params)
        format.html { redirect_to @adress_information, notice: 'Adress information was successfully updated.' }
        format.json { render :show, status: :ok, location: @adress_information }
      else
        format.html { render :edit }
        format.json { render json: @adress_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adress_informations/1
  # DELETE /adress_informations/1.json
  def destroy
    @adress_information.destroy
    respond_to do |format|
      format.html { redirect_to adress_informations_url, notice: 'Adress information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adress_information
      @adress_information = AdressInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adress_information_params
      params.require(:adress_information).permit(:adress, :postal_code, :cell_phone, :city)
    end
end

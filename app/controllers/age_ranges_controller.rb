class AgeRangesController < ApplicationController
  before_action :set_age_range, only: [:show, :edit, :update, :destroy]

  # GET /age_ranges
  # GET /age_ranges.json
  def index
    @age_ranges = AgeRange.all
  end

  # GET /age_ranges/1
  # GET /age_ranges/1.json
  def show
  end

  # GET /age_ranges/new
  def new
    @age_range = AgeRange.new
  end

  # GET /age_ranges/1/edit
  def edit
  end

  # POST /age_ranges
  # POST /age_ranges.json
  def create
    @age_range = AgeRange.new(age_range_params)

    respond_to do |format|
      if @age_range.save
        format.html { redirect_to @age_range, notice: 'Age range was successfully created.' }
        format.json { render :show, status: :created, location: @age_range }
      else
        format.html { render :new }
        format.json { render json: @age_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /age_ranges/1
  # PATCH/PUT /age_ranges/1.json
  def update
    respond_to do |format|
      if @age_range.update(age_range_params)
        format.html { redirect_to @age_range, notice: 'Age range was successfully updated.' }
        format.json { render :show, status: :ok, location: @age_range }
      else
        format.html { render :edit }
        format.json { render json: @age_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /age_ranges/1
  # DELETE /age_ranges/1.json
  def destroy
    @age_range.destroy
    respond_to do |format|
      format.html { redirect_to age_ranges_url, notice: 'Age range was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_age_range
      @age_range = AgeRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def age_range_params
      params.require(:age_range).permit(:age)
    end
end

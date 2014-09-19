class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:seller, :new, :create, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]

  def seller
    @listings = Listing.where(user: current_user).order("created_at DESC")
  end

  # GET /listings
  # GET /listings.json
  def index
    find_listing

    if (params[:category].blank?) && (params[:gender].blank?)
      @listings ||= Listing.all.order("created_at DESC")
      @listings = @listings.paginate(:page => params[:page], :per_page => 12)
    else
      @category_id = Category.find_by(name: params[:category]).id rescue ''
     # @gender_id = Gender.find_by(name: params[:gender]).id rescue ''
      @listings = Listing.where(category_id: @category_id)
      #if @gender_id.present?
       # @listings = @listings.where(gender_id: @gender_id)
      #end
      @listings = @listings.paginate(:page => params[:page], :per_page => 12)
    end
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
     @listing = current_user.listings.build
     @listing.user.build_bank_information
  end
 
  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
      
      @listing = Listing.new(listing_params)
      
      @listing.user_id = current_user.id

      @listing.save 

        @bank_information_data = bank_account_params
        @bank_info = BankInformation.new(@bank_information_data['user_attributes']['bank_information_attributes'])
        @bank_info.user_id =  current_user.id
        @bank_info.save
    

   # if current_user.recipient.blank?
   #   Stripe.api_key = ENV["STRIPE_API_KEY"]
   #   token = params[:stripeToken]

    #  recipient = Stripe::Recipient.create(
    #    :name => current_user.name,
    #    :type => "individual",
    #    :bank_account => token
    #    )

    #  current_user.recipient = recipient.id
    #  current_user.save
    #end

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def find_listing
     conditions = []
     conditions << "listings.name LIKE '%#{params[:name]}%'" if params[:name].present?
     conditions << "listings.description LIKE '%#{params[:description]}%'" if params[:description].present?
     @listings = Listing.where(conditions.join(" AND ")).order("listings.name" || "listings.description")

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:id, :name, :description, :price, :image, :category_id, :postal_code, :location, :product_condition, :gender_id, :age_range, :delivery_information)
    end

    def bank_account_params
      params.require(:listing).permit(user_attributes: [ :id, bank_information_attributes: [:id, :bank_account, :bank_name] ])
    end

    def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
      end
    end

end

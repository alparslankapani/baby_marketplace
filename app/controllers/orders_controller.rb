class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def sales
    @orders = Order.all.where(seller: current_user).order("created_at DESC")
  end

  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
  end

  # GET /orders/new
  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])
    @order.user.build_bank_information unless current_user.has_bank_information?
    @order.user.build_adress_information unless current_user.has_adress?
  end


  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @listing = Listing.find(params[:listing_id])
    @seller = @listing.user

    @order.listing_id = @listing.id 
    @order.buyer_id = current_user.id
    @order.seller_id = @seller.id

      unless adress_field_params.blank?
        @adress_information_data = adress_field_params
        puts adress_field_params
        #debugger
        @adress_info = AdressInformation.new(@adress_information_data['user_attributes']['adress_information_attributes'])
        @adress_info.user_id = current_user.id
        @adress_info.save
      end

    Stripe.api_key = ENV["STRIPE_API_KEY"]
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        :amount => (@listing.price * 100).floor,
        :currency => "usd",
        :card => token
        )

      flash[:notice] = "Thanks for Ordering!"
    rescue Stripe::CardError => e
      flash[:danger] = e.message
    end

    #transfer = Stripe::Transfer.create(
    #  :amount => (@listing.price * 95).floor,
    #  :currency => "usd",
    #  :recipient => @seller.recipient
    #  )

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_url }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:adress)
    end

    def adress_field_params
      params.require(:order).permit(user_attributes: [:id, adress_information_attributes: [:id, :adress, :postal_code, :city, :cell_phone] ])
    end
end

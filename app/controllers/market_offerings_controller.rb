class MarketOfferingsController < ApplicationController
  before_action :set_market_offering, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /market_offerings
  # GET /market_offerings.json
  def index
    @market_offerings = policy_scope(MarketOffering)
  end

  # GET /market_offerings/1
  # GET /market_offerings/1.json
  def show
  end

  # GET /market_offerings/new
  def new
    @market_offering = MarketOffering.new
    authorize @market_offering
  end

  # GET /market_offerings/1/edit
  def edit
  end

  # POST /market_offerings
  # POST /market_offerings.json
  def create
    @market_offering = MarketOffering.new(market_offering_params)
    authorize @market_offering
    respond_to do |format|
      if @market_offering.save
        format.html { redirect_to @market_offering, notice: 'Market offering was successfully created.' }
        format.json { render :show, status: :created, location: @market_offering }
      else
        format.html { render :new }
        format.json { render json: @market_offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /market_offerings/1
  # PATCH/PUT /market_offerings/1.json
  def update
    respond_to do |format|
      if @market_offering.update(market_offering_params)
        format.html { redirect_to @market_offering, notice: 'Market offering was successfully updated.' }
        format.json { render :show, status: :ok, location: @market_offering }
      else
        format.html { render :edit }
        format.json { render json: @market_offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /market_offerings/1
  # DELETE /market_offerings/1.json
  def destroy
    @market_offering.destroy
    respond_to do |format|
      format.html { redirect_to market_offerings_url, notice: 'Market offering was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market_offering
      @market_offering = MarketOffering.find(params[:id])
      authorize @market_offering
    end

    # Only allow a list of trusted parameters through.
    def market_offering_params
      params.require(:market_offering).permit(:title, :body)
    end
end

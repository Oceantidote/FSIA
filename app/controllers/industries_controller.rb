class IndustriesController < ApplicationController
  before_action :set_industry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /industries
  # GET /industries.json
  def index
    @industries = policy_scope(Industry)
  end

  # GET /industries/1
  # GET /industries/1.json
  def show
  end

  # GET /industries/new
  def new
    @industry = Industry.new
    authorize @industry
  end

  # GET /industries/1/edit
  def edit
  end

  # POST /industries
  # POST /industries.json
  def create
    @industry = Industry.new(industry_params)
    authorize @industry
    respond_to do |format|
      if @industry.save
        format.html { redirect_to @industry, notice: 'Industry was successfully created.' }
        format.json { render :show, status: :created, location: @industry }
      else
        format.html { render :new }
        format.json { render json: @industry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industries/1
  # PATCH/PUT /industries/1.json
  def update
    respond_to do |format|
      if @industry.update(industry_params)
        format.html { redirect_to @industry, notice: 'Industry was successfully updated.' }
        format.json { render :show, status: :ok, location: @industry }
      else
        format.html { render :edit }
        format.json { render json: @industry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industries/1
  # DELETE /industries/1.json
  def destroy
    @industry.destroy
    respond_to do |format|
      format.html { redirect_to industries_url, notice: 'Industry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry
      @industry = Industry.find(params[:id])
      authorize @industry
    end

    # Only allow a list of trusted parameters through.
    def industry_params
      params.require(:industry).permit(:title, :body)
    end
end

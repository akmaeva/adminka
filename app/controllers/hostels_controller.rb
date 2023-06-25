class HostelsController < ApplicationController
  before_action :set_hostel, only: %i[ show edit update destroy ]
  before_action :set_hostels

  # Экшен для загрузки списка стран
  def countries
    @countries = Country.all
    render json: @countries
  end

  # Экшен для загрузки списка регионов
  def regions
    @regions = Region.where(country_id: params[:country_id])
    render json: @regions
  end

  # Экшен для загрузки списка городов
  def towns
    @towns = Town.where(region_id: params[:region_id])
    render json: @towns
  end

  # GET /hostels or /hostels.json
  def index
    @hostels = Hostel.all
  end

  # GET /hostels/1 or /hostels/1.json
  def show
  end

  # GET /hostels/new
  def new
    @hostel = Hostel.new
  end

  # GET /hostels/1/edit
  def edit
  end

  # POST /hostels or /hostels.json
  def create
    @hostel = Hostel.new(hostel_params)

    respond_to do |format|
      if @hostel.save
        format.html { redirect_to hostel_url(@hostel), notice: "Hostel was successfully created." }
        format.json { render :show, status: :created, location: @hostel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hostel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hostels/1 or /hostels/1.json
  def update
    respond_to do |format|
      if @hostel.update(hostel_params)
        format.html { redirect_to hostel_url(@hostel), notice: "Hostel was successfully updated." }
        format.json { render :show, status: :ok, location: @hostel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hostel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hostels/1 or /hostels/1.json
  def destroy
    @hostel.destroy

    respond_to do |format|
      format.html { redirect_to hostels_url, notice: "Hostel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hostel
      @hostel = Hostel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hostel_params
      params.require(:hostel).permit(:name, :country, :region, :town, :contact)
    end

    def set_hostels
      @country = Country.find_by(id: params[:country].presence)
      @region = Country.find_by(id: params[:regions].presence)
      @town = Country.find_by(id: params[:towns])
    end
end

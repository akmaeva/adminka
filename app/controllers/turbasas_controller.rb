class TurbasasController < ApplicationController
  before_action :set_turbasa, only: %i[ show edit update destroy ]

  # Экшен для загрузки списка стран
  def countrieslist
    @countries = Country.all
    render json: @countries
  end

  # Экшен для загрузки списка регионов
  def regionslist
    @regions = Region.where(country_id: params[:country_id])
    render json: @regions
  end

  # Экшен для загрузки списка городов
  def townslist
    @towns = Town.where(region_id: params[:region_id])
    render json: @towns
  end


  # GET /turbasas or /turbasas.json
  def index
    @turbasas = Turbasa.all
  end

  # GET /turbasas/1 or /turbasas/1.json
  def show
  end

  # GET /turbasas/new
  def new
    @turbasa = Turbasa.new
  end

  # GET /turbasas/1/edit
  def edit
  end

  # POST /turbasas or /turbasas.json
  def create
    @turbasa = Turbasa.new(turbasa_params)

    respond_to do |format|
      if @turbasa.save
        format.html { redirect_to turbasa_url(@turbasa), notice: "Turbasa was successfully created." }
        format.json { render :show, status: :created, location: @turbasa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @turbasa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turbasas/1 or /turbasas/1.json
  def update
    respond_to do |format|
      if @turbasa.update(turbasa_params)
        format.html { redirect_to turbasa_url(@turbasa), notice: "Turbasa was successfully updated." }
        format.json { render :show, status: :ok, location: @turbasa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @turbasa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turbasas/1 or /turbasas/1.json
  def destroy
    @turbasa.destroy

    respond_to do |format|
      format.html { redirect_to turbasas_url, notice: "Turbasa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turbasa
      @turbasa = Turbasa.find params[:id]
    end

    # Only allow a list of trusted parameters through.
    def turbasa_params
      params.require(:turbasa).permit(:name, :country_id, :region_id, :town_id, :contact)
    end
end

class CountriesController < ApplicationController
    before_action :set_country, only: %i[ show edit update destroy ]

    def index
        @countries = Country.all
    end

    def new
        @country = Country.new
    end

    def edit
        @country = Country.find_by id: params[:id]
    end

    def show
    end

    def create
        @country = Country.new(country_params)

        respond_to do |format|
            if Country.exists?(name: @country.name)
                format.html { redirect_to countries_url, notice: "Country already exists." }
                format.json { render json: { error: "Country already exists." }, status: :unprocessable_entity }
            elsif @country.save
                format.html { redirect_to countries_url, notice: "Country was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @country.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @country.update(country_params)
                format.html { redirect_to countries_url, notice: "Country was successfully updated." }
                format.json { render :show, status: :ok, location: @country }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @country.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @country.destroy
    
        respond_to do |format|
          format.html { redirect_to countries_url, notice: "Country was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    private
    def set_country
        @country = Country.find params[:id]
    end

    def country_params
        params.require(:country).permit(:name)
    end
end
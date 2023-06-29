class TownsController < ApplicationController
    before_action :set_town, only: %i[ show edit update destroy ]

    def countrieslist
        @countries = Country.all
        render json: @countries
    end

    def regionslist
        @regions = Region.where(country_id: params[:country_id])
        render json: @regions
    end

    def index
        @towns = Town.all
    end

    def new
        @town = Town.new
    end

    def edit
        @town = Town.find_by id: params[:id]
    end

    def show
    end

    def create
        @town = Town.new(town_params)

        respond_to do |format|
            if Town.exists?(name: @town.name)
                format.html { redirect_to towns_url, notice: "Town already exists." }
                format.json { render json: { error: "Town already exists." }, status: :unprocessable_entity }
            elsif @town.save
                format.html { redirect_to towns_url, notice: "Town was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @town.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @town.update(town_params)
                format.html { redirect_to towns_url, notice: "Town was successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @town.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @town.destroy
    
        respond_to do |format|
          format.html { redirect_to towns_url, notice: "Town was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    private
    def set_town
        @town = Town.find params[:id]
    end

    def town_params
        params.require(:town).permit(:name, :country_id, :region_id)
    end
end
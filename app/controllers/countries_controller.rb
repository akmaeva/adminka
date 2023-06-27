class CountriesController < ApplicationController

    def index
        @countries = Country.all
    end

    def new
        @country = Country.new
    end

    def edit
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
                format.html { redirect_to country_url(@country), notice: "Country was successfully created." }
                format.json { render :show, status: :created, location: @country }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @country.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if Country.exists?(name: @country.name)
                format.html { redirect_to countries_url, notice: "Country already exists." }
                format.json { render json: { error: "Country already exists." }, status: :unprocessable_entity }
            elsif @country.update(country_params)
                format.html { redirect_to country_url(@country), notice: "Country was successfully updated." }
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

    def country_params
        params.require(:country).permit(:name)
      end
end
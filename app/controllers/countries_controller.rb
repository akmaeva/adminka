class CountriesController < ApplicationController
    def new
        @country = Country.new
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

    private

    def country_params
        params.require(:country).permit(:name)
      end
end
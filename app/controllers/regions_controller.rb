class RegionsController < ApplicationController
    before_action :set_region, only: %i[ show edit update destroy ]

    def index
        @regions = Region.all
    end

    def new
        @region = Region.new
    end

    def edit
        @region = Region.find_by id: params[:id]
    end

    def show
    end

    def create
        @region = Region.new(region_params)

        respond_to do |format|
            if Region.exists?(name: @region.name)
                format.html { redirect_to regions_url, notice: "Region already exists." }
                format.json { render json: { error: "Region already exists." }, status: :unprocessable_entity }
            elsif @region.save
                format.html { redirect_to regions_url, notice: "Region was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @region.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @region.update(region_params)
                format.html { redirect_to regions_url, notice: "Region was successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @region.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @region.destroy
    
        respond_to do |format|
          format.html { redirect_to countries_url, notice: "Region was successfully destroyed." }
          format.json { head :no_content }
        end
    end

    private

    def set_region
        @region = Region.find params[:id]
    end

    def region_params
        params.require(:region).permit(:name, :country_id)
    end
end

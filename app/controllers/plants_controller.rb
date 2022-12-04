class PlantsController < ApplicationController
    def index
        plant = Plant.all
        render json: plant, only: [:id, :name, :image, :price]
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, only: [:id, :name, :image, :price], status: :ok
        else
            render json: {error: "no plant"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private
    def plant_params
        params.permit(:name, :image, :price)
    end
end

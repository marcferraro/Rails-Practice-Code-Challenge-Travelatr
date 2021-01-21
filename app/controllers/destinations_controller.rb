class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.new(destination_params)
        @destination.save

        redirect_to destination_path(@destination)
    end

    def edit
        @destination = Destination.find(params[:id])
    end

    def update
        @destination = Destination.find(params[:id])
        @destination.update(destination_params)

        redirect_to destination_path(@destination)
    end

    def show
        @destination = Destination.find(params[:id])
    end

    private

    def destination_params
        params.require(:destination).permit(:name, :country)
    end

end
class V1::PlacesController < ApplicationController
    def index
        place = Place.all()

        render json: Response::success(place), status: 200
    end

    def create
        render json: Response::badRequest(), status: 400 if params[:name].blank? && params[:area].blank?

        place = Place.new(name: params[:name], area: params[:area])

        if place.save
            render json: Response::success(place), status: 200
        else
            render json: Response::serverError(place.errors), status: 500
        end
    end
end

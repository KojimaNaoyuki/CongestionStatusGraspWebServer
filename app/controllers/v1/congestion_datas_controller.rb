class V1::CongestionDatasController < ApplicationController
    def show
        congestion_data = CongestionDatum.find(params[:id])

        if congestion_data
            render json: Response::success(congestion_data), status: 200
        else
            render json: Response::notFound(), status: 404
        end
    end

    def create
        render json: Response::badRequest(), status: 400 if params[:place_id].blank?

        place = Place.find(params[:place_id])

        congestion_data = CongestionDatum.new(number_of_people: 0, density: 0, place: place)

        if congestion_data.save
            render json: Response::success(congestion_data), status: 200
        else
            render json: Response::serverError(congestion_data.errors), status: 500
        end
    end

    def update
        congestion_data = CongestionDatum.find(params[:id])

        if congestion_data.update(number_of_people: params[:people], density: get_density(params[:people], congestion_data.place_id))
            render json: Response::success(congestion_data), status: 200
        else
            render json: Response::serverError(congestion_data.errors), status: 500
        end
    end

    def serach
        congestion_data = CongestionDatum.joins(:place).merge(Place.where(name: params[:name]))
        
        render json: Response::success(congestion_data), status: 200
    end

    private

        def get_density(number_of_people, place_id)
            place = Place.find(place_id)

            return place.area / number_of_people.to_i
        end
end
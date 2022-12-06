class V1::CongestionDatumController < ApplicationController
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

        place = Place.find(place_id)

        density = get_density(params[:people], place)

        # logを保存
        CongestionDataLogs.create({
            number_of_people: params[:people],
            density: density,
            place_name: place.name
        })

        if congestion_data.update(number_of_people: params[:people], density: density)
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

        def get_density(number_of_people, place)
            return place.area / number_of_people.to_i
        end
end
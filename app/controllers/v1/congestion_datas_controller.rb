class V1::CongestionDatasController < ApplicationController
    def show
        congestion_data = CongestionDatum.find_by(params[:congestion_data_id])
        
        render json: Response::success(congestion_data), status: 200
    end
end
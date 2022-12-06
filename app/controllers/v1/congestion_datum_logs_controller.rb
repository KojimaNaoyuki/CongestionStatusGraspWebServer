class V1::CongestionDatumLogsController < ApplicationController
    def index
        congestion_data_log = CongestionDataLogs.all()

        render json: Response::success(congestion_data_log), status: 200
    end
end
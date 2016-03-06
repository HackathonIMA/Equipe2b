module API
  module V1
    class HealthCaresController < ApplicationController

      def history
        year = params[:year] || 2015
        @histories = ::HealthCare::History.includes(:locale).where('year  >= ?', year)
        render json: @histories, each_serializer: ::HealthCareHistorySerializer
      end
    end
  end
end

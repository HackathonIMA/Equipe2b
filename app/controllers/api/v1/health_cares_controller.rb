module API
  module V1
    class HealthCaresController < ApplicationController

      def history
        year = params[:year] || 2013
        @histories = ::HealthCare::History.joins(:locale).preload(:locale).
                      where('locales.lat is not null').
                      where('year  >= ?', year)
        render json: @histories, each_serializer: ::HealthCareHistorySerializer
      end
    end
  end
end

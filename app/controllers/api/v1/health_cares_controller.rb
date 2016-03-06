module API
  module V1
    class HealthCaresController < ApplicationController

      def create
        @health_care = ::HealthCare.new locale_id: params[:locale_id]

        @health_care.data_atendimento = Date.current
        @health_care.hora_atendimento = DateTime.current

        if @health_care.save
          head :created
        else
          head :unprocessable_entity
        end
      end

      def history
        year = params[:year] || 2015
        @histories = ::HealthCare::History.includes(:locale).where('year  >= ?', year)
        render json: @histories, each_serializer: ::HealthCareHistorySerializer
      end
    end
  end
end

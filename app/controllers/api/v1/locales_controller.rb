module API
  module V1
    class LocalesController < ApplicationController

      def health_cares
        @health_care = ::HealthCare.new locale_id: params[:id]

        @health_care.data_atendimento = Date.current
        @health_care.hora_atendimento = DateTime.current

        if @health_care.save
          head :created
        else
          head :unprocessable_entity
        end
      end
    end
  end
end

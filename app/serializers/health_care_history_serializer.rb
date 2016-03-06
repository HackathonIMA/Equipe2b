class HealthCareHistorySerializer < ActiveModel::Serializer
  attributes :total,
             :year,
             :month,
             :local_atendimento,
             :locale_lat,
             :locale_lng,
             :distrito_atendimento,
             :capacidade_atendimento,
             :nivel_lotacao

  def nivel_lotacao
    object.total.to_f / object.capacidade_atendimento
  end
end

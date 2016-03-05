module API
  class HealthCare
    include HTTParty

    base_uri  Rails.application.secrets.api['base_uri']
    headers  "client_id" => Rails.application.secrets.api['client_id']

    def self.extract(options = {})
      default_range = { offset: 1, limit: 100 }
      filters = default_range.merge options
      req = get "/saude", query: filters

      return false unless req.response.code == '200'
      parse_body JSON.parse(req.response.body, symbolize_names: true)
    end

    def self.parse_body(health_cares)
      health_cares.each {|health_care| parse_health_care health_care}
    end
    private_class_method :parse_body

    def self.parse_health_care(health_care)
      ::HealthCare.create origin_id: health_care[:id],
        locale_id: parse_locale(health_care).id,
        data_atendimento: parse_data(health_care[:dataAtendimento]),
        codigo_tipo_atendimento: health_care[:codigoTipoAtendimento],
        descricao_tipo_atendimento: health_care[:descricaoTipoAtendimento],
        codigo_grupo_gtendimento_sus: health_care[:descricaoGrupoAtendimento],
        descricao_grupo_atendimento: health_care[:codigoGrupoAtendimentoSUS],
        ocupacao_profissional: health_care[:ocupacaoProfissional],
        descricao_tipo_vinculo_sms: health_care[:descricaoTipoVinculoSMS],
        codigo_procedimento_sus: health_care[:codigoProcedimentoSUS],
        descricao_procedimento: health_care[:descricaoProcedimento],
        codigo_atividade_profissional_sus: health_care[:codigoAtividadeProfissionalSUS],
        descricao_atividade_profissional: health_care[:descricaoAtividadeProfissional],
        sexo: health_care[:sexo],
        idade: health_care[:idade],
        hora: health_care[:hora],
        periodo: health_care[:periodo],
        data_nascimento: health_care[:dataNascimento],
        quantidade_realizada: health_care[:quantidadeRealizada],
        hora_atendimento: parse_hora_atendimento(health_care)
    end
    private_class_method :parse_health_care

    def self.parse_locale(health_care)
      ::Locale.where(
          distrito_vinculo: health_care[:distritoVinculo],
          local_atendimento: health_care[:localAtendimento],
          distrito_atendimento: health_care[:distritoAtendimento]
        ).first_or_create

    end
    private_class_method :parse_locale

    def self.parse_data(date)
      Date.parse date if date.present?
    end
    private_class_method :parse_data

    def self.parse_hora_atendimento(health_care)
      date = parse_data(health_care[:dataAtendimento])

      date.to_datetime + health_care[:hora].to_i.hours
    end
    private_class_method :parse_hora_atendimento

  end
end

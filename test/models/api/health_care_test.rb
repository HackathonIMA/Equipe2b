require "test_helper"
module API
  class HealthCareTest < Minitest::Test
    def setup
      @health_care_json = {
        "id": "28e6cd77715c",
        "distritoVinculo": "DISTRITO NOROESTE",
        "municipio": "CAMPINAS",
        "uf": "SAO PAULO",
        "localAtendimento": "CENTRO DE SAUDE JARDIM FLORENCE",
        "distritoAtendimento": "DISTRITO NOROESTE",
        "dataAtendimento": "2012-12-20T03:00:00.000Z",
        "codigoTipoAtendimento": "00",
        "descricaoTipoAtendimento": "SEM RESTRICAO DE TIPO DE ATENDIMENTO",
        "descricaoGrupoAtendimento": "OUTROS GRUPOS",
        "codigoGrupoAtendimentoSUS": "99",
        "ocupacaoProfissional": "TERAPEUTA OCUPACIONAL - ESPECIALISTA EM ORIENTAÇÃO E MOBILIDADE DE DEFICIENTES VISUAIS , PERIPATOLOGISTA , PROFESSOR EM ORIENTAÇÃO E MOBILIDADE DE DEFICIENTES VISUAIS.",
        "descricaoTipoVinculoSMS": "NÃO INFORMADO",
        "codigoProcedimentoSUS": "030104004",
        "descricaoProcedimento": "TERAPIA INDIVIDUAL",
        "codigoAtividadeProfissionalSUS": "57",
        "descricaoAtividadeProfissional": "TERAPEUTA OCUPACIONAL",
        "sexo": "FEMININO",
        "idade": " 11 anos  ",
        "hora": "09H",
        "periodo": "MANHA",
        "dataNascimento": "2001-07-28T03:00:00.000Z",
        "quantidadeRealizada": 1
        }
    end

    def test_parse_hora_atendimento
      data_hora = DateTime.parse "2012-12-20 09:00"
      assert_equal data_hora, API::HealthCare.send(:parse_hora_atendimento ,@health_care_json)
    end

    def test_parse_locale
      locale =  API::HealthCare.send(:parse_locale, @health_care_json)
      assert_equal @health_care_json[:distritoAtendimento], locale.distrito_atendimento
    end

    def test_dont_duplicate_locale
      locale =  API::HealthCare.send(:parse_locale, @health_care_json)
      locale =  API::HealthCare.send(:parse_locale, @health_care_json)
      assert_equal 1, Locale.count
    end

    def test_parse_health_care
      health_care = API::HealthCare.send(:parse_health_care, @health_care_json)
      assert_equal @health_care_json[:id], health_care.origin_id
    end

    def test_parse_health_care_correct_locale
      health_care = API::HealthCare.send(:parse_health_care, @health_care_json)
      assert_equal @health_care_json[:distritoAtendimento], health_care.locale.distrito_atendimento
    end
  end
end

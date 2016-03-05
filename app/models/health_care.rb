# == Schema Information
#
# Table name: health_cares
#
#  id                                :integer          not null, primary key
#  origin_id                         :string
#  locale_id                         :integer
#  data_atendimento                  :date
#  codigo_tipo_atendimento           :string
#  descricao_tipo_atendimento        :string
#  codigo_grupo_gtendimento_sus      :string
#  descricao_grupo_atendimento       :string
#  ocupacao_profissional             :integer
#  descricao_tipo_vinculo_sms        :string
#  codigo_procedimento_sus           :string
#  descricao_procedimento            :string
#  codigo_atividade_profissional_sus :string
#  descricao_atividade_profissional  :string
#  sexo                              :string
#  idade                             :string
#  hora                              :string
#  periodo                           :string
#  data_nascimento                   :string
#  quantidade_realizada              :integer
#  hora_atendimento                  :datetime
#  hora_saida_local                  :datetime
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#
# Indexes
#
#  index_health_cares_on_codigo_procedimento_sus  (codigo_procedimento_sus)
#  index_health_cares_on_descricao_procedimento   (descricao_procedimento)
#  index_health_cares_on_locale_id                (locale_id)
#  index_health_cares_on_origin_id                (origin_id)
#
# Foreign Keys
#
#  fk_rails_57c398b540  (locale_id => locales.id)
#

class HealthCare < ActiveRecord::Base
  belongs_to :locale
end

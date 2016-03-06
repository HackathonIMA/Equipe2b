# == Schema Information
#
# Table name: vw_health_care_histories
#
#  total     :integer
#  locale_id :integer
#  year      :float
#  month     :float
#

class HealthCare::History < ActiveRecord::Base
  self.table_name = 'vw_health_care_histories'

  belongs_to :locale

  delegate :distrito_vinculo,
           :local_atendimento,
           :distrito_atendimento,
           :capacidade_atendimento,
           to: :locale
  delegate :lat, :lng, prefix: true, to: :locale

  def readonly?
    true
  end

  def self.refresh
    ActiveRecord::Base.connection.execute <<-SQL
      REFRESH MATERIALIZED VIEW vw_health_care_histories
    SQL
  end
end

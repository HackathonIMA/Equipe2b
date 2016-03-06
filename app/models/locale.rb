# == Schema Information
#
# Table name: locales
#
#  id                     :integer          not null, primary key
#  distrito_vinculo       :string
#  local_atendimento      :string
#  distrito_atendimento   :string
#  lat                    :float
#  lng                    :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  capacidade_atendimento :integer
#

class Locale < ActiveRecord::Base
  has_many :health_cares
  has_many :histories, -> { where('year > 2012')}, class_name: HealthCare::History
end

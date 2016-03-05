# == Schema Information
#
# Table name: locales
#
#  id                   :integer          not null, primary key
#  distrito_vinculo     :string
#  local_atendimento    :string
#  distrito_atendimento :string
#  lat                  :float
#  lng                  :float
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Locale < ActiveRecord::Base
end

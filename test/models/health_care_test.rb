require "test_helper"

class HealthCareTest < ActiveSupport::TestCase
  def health_care
    @health_care ||= HealthCare.new
  end

  should validate_presence_of(:locale_id)
  should validate_uniqueness_of(:origin_id)
  should belong_to(:locale)
  should have_db_index(:origin_id)
  should have_db_index(:data_atendimento)
  should have_db_index(:codigo_procedimento_sus)
  should have_db_index(:descricao_procedimento)
end

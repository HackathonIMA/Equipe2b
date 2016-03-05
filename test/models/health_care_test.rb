require "test_helper"

class HealthCareTest < ActiveSupport::TestCase
  def health_care
    @health_care ||= HealthCare.new
  end

  should validate_presence_of(:locale_id)
  should belong_to(:locale)
end

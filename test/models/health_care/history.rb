require "test_helper"

class HealthCare::HistoryTest < ActiveSupport::TestCase
  should belong_to(:locale)
end

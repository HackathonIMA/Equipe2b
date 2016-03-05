require "test_helper"

class LocaleTest < ActiveSupport::TestCase
  def locale
    @locale ||= Locale.new
  end
   should have_many(:health_cares)
end

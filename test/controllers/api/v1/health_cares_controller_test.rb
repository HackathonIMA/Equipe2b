require "test_helper"

class API::V1::HealthCaresControllerTest < ActionController::TestCase
  def test_history
    get :history
    assert_response :success
  end
end

require "test_helper"

class API::V1::HealthCaresControllerTest < ActionController::TestCase
  def setup
    @locale = create :locale
  end

  def test_history
    get :history
    assert_response :success
  end

  def test_created
    assert_difference('HealthCare.count') do
      post :create, locale_id: @locale.id
    end
  end


end

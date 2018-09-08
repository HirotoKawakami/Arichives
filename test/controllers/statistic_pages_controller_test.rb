require 'test_helper'

class StatisticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get statistic_pages_index_url
    assert_response :success
  end

end

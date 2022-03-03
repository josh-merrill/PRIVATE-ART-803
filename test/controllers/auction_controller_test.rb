require "test_helper"

class AuctionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get auction_show_url
    assert_response :success
  end
end

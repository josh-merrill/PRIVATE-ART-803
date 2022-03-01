require "test_helper"

class ArtworksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artworks_index_url
    assert_response :success
  end

  test "should get new" do
    get artworks_new_url
    assert_response :success
  end
end

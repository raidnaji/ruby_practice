require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    # This code is executed once before each test is run
    @link = links(:linkOne)     # retrieves 'one' from fixtres.yml
  end

  test "should get index" do
    get links_url           # links_url -> links#index
    assert_response :success
  end
end
require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    # This code is executed once before each test is run
    @link = links(:linkOne)     # retrieves 'linkOne' from fixtres.yml

    get new_user_session_url    # -> devise/sessions#new
    sign_in users(:test_user)   # sign_in is the devise method to sign in a user
    post user_session_url       # -> devise/sessions#create
  end

  test "should get index" do
    get links_url           # links_url -> links#index
    assert_response :success
  end

  test "create and view link" do
  # new_link -> links#new
    get new_link_url
    assert_response :success
  
  # links GET -> links#index, links POST -> links#create
    post links_url, params: { link: { title: "Test link", url: "success.com" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "links header" do
    get links_url                # -> links#index
    assert_select 'h1', 'Links'
  end

  test "forms on index" do
    get links_url
    assert_select 'form', true  #the sign out button is a form
  end

  test "form input name" do
    get new_link_url             # -> links#new
    assert_select "form input" do
      assert_select "[name]" # Not empty
    end
  end
end
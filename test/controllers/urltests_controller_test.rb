require "test_helper"

class UrltestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urltest = urltests(:one)
  end

  test "should get index" do
    get urltests_url, as: :json
    assert_response :success
  end

  test "should create urltest" do
    assert_difference("Urltest.count") do
      post urltests_url, params: { urltest: { targetUrl: @urltest.targetUrl, testName: @urltest.testName } }, as: :json
    end

    assert_response :created
  end

  test "should show urltest" do
    get urltest_url(@urltest), as: :json
    assert_response :success
  end

  test "should update urltest" do
    patch urltest_url(@urltest), params: { urltest: { targetUrl: @urltest.targetUrl, testName: @urltest.testName } }, as: :json
    assert_response :success
  end

  test "should destroy urltest" do
    assert_difference("Urltest.count", -1) do
      delete urltest_url(@urltest), as: :json
    end

    assert_response :no_content
  end
end

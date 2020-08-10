require 'test_helper'

class MarketOfferingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @market_offering = market_offerings(:one)
  end

  test "should get index" do
    get market_offerings_url
    assert_response :success
  end

  test "should get new" do
    get new_market_offering_url
    assert_response :success
  end

  test "should create market_offering" do
    assert_difference('MarketOffering.count') do
      post market_offerings_url, params: { market_offering: { title: @market_offering.title } }
    end

    assert_redirected_to market_offering_url(MarketOffering.last)
  end

  test "should show market_offering" do
    get market_offering_url(@market_offering)
    assert_response :success
  end

  test "should get edit" do
    get edit_market_offering_url(@market_offering)
    assert_response :success
  end

  test "should update market_offering" do
    patch market_offering_url(@market_offering), params: { market_offering: { title: @market_offering.title } }
    assert_redirected_to market_offering_url(@market_offering)
  end

  test "should destroy market_offering" do
    assert_difference('MarketOffering.count', -1) do
      delete market_offering_url(@market_offering)
    end

    assert_redirected_to market_offerings_url
  end
end

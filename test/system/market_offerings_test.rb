require "application_system_test_case"

class MarketOfferingsTest < ApplicationSystemTestCase
  setup do
    @market_offering = market_offerings(:one)
  end

  test "visiting the index" do
    visit market_offerings_url
    assert_selector "h1", text: "Market Offerings"
  end

  test "creating a Market offering" do
    visit market_offerings_url
    click_on "New Market Offering"

    fill_in "Title", with: @market_offering.title
    click_on "Create Market offering"

    assert_text "Market offering was successfully created"
    click_on "Back"
  end

  test "updating a Market offering" do
    visit market_offerings_url
    click_on "Edit", match: :first

    fill_in "Title", with: @market_offering.title
    click_on "Update Market offering"

    assert_text "Market offering was successfully updated"
    click_on "Back"
  end

  test "destroying a Market offering" do
    visit market_offerings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Market offering was successfully destroyed"
  end
end

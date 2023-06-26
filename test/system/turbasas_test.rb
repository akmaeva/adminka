require "application_system_test_case"

class TurbasasTest < ApplicationSystemTestCase
  setup do
    @turbasa = turbasas(:one)
  end

  test "visiting the index" do
    visit turbasas_url
    assert_selector "h1", text: "Turbasas"
  end

  test "should create turbasa" do
    visit turbasas_url
    click_on "New turbasa"

    fill_in "Contact", with: @turbasa.contact
    fill_in "Country", with: @turbasa.country_id
    fill_in "Name", with: @turbasa.name
    fill_in "Region", with: @turbasa.region_id
    fill_in "Town", with: @turbasa.town_id
    click_on "Create Turbasa"

    assert_text "Turbasa was successfully created"
    click_on "Back"
  end

  test "should update Turbasa" do
    visit turbasa_url(@turbasa)
    click_on "Edit this turbasa", match: :first

    fill_in "Contact", with: @turbasa.contact
    fill_in "Country", with: @turbasa.country_id
    fill_in "Name", with: @turbasa.name
    fill_in "Region", with: @turbasa.region_id
    fill_in "Town", with: @turbasa.town_id
    click_on "Update Turbasa"

    assert_text "Turbasa was successfully updated"
    click_on "Back"
  end

  test "should destroy Turbasa" do
    visit turbasa_url(@turbasa)
    click_on "Destroy this turbasa", match: :first

    assert_text "Turbasa was successfully destroyed"
  end
end

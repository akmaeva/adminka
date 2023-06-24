require "application_system_test_case"

class HostelsTest < ApplicationSystemTestCase
  setup do
    @hostel = hostels(:one)
  end

  test "visiting the index" do
    visit hostels_url
    assert_selector "h1", text: "Hostels"
  end

  test "should create hostel" do
    visit hostels_url
    click_on "New hostel"

    fill_in "Contact", with: @hostel.contact
    fill_in "Country", with: @hostel.country
    fill_in "Name", with: @hostel.name
    fill_in "Region", with: @hostel.region
    fill_in "Town", with: @hostel.town
    click_on "Create Hostel"

    assert_text "Hostel was successfully created"
    click_on "Back"
  end

  test "should update Hostel" do
    visit hostel_url(@hostel)
    click_on "Edit this hostel", match: :first

    fill_in "Contact", with: @hostel.contact
    fill_in "Country", with: @hostel.country
    fill_in "Name", with: @hostel.name
    fill_in "Region", with: @hostel.region
    fill_in "Town", with: @hostel.town
    click_on "Update Hostel"

    assert_text "Hostel was successfully updated"
    click_on "Back"
  end

  test "should destroy Hostel" do
    visit hostel_url(@hostel)
    click_on "Destroy this hostel", match: :first

    assert_text "Hostel was successfully destroyed"
  end
end

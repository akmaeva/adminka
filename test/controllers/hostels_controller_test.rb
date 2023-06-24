require "test_helper"

class HostelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hostel = hostels(:one)
  end

  test "should get index" do
    get hostels_url
    assert_response :success
  end

  test "should get new" do
    get new_hostel_url
    assert_response :success
  end

  test "should create hostel" do
    assert_difference("Hostel.count") do
      post hostels_url, params: { hostel: { contact: @hostel.contact, country: @hostel.country, name: @hostel.name, region: @hostel.region, town: @hostel.town } }
    end

    assert_redirected_to hostel_url(Hostel.last)
  end

  test "should show hostel" do
    get hostel_url(@hostel)
    assert_response :success
  end

  test "should get edit" do
    get edit_hostel_url(@hostel)
    assert_response :success
  end

  test "should update hostel" do
    patch hostel_url(@hostel), params: { hostel: { contact: @hostel.contact, country: @hostel.country, name: @hostel.name, region: @hostel.region, town: @hostel.town } }
    assert_redirected_to hostel_url(@hostel)
  end

  test "should destroy hostel" do
    assert_difference("Hostel.count", -1) do
      delete hostel_url(@hostel)
    end

    assert_redirected_to hostels_url
  end
end

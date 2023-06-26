require "test_helper"

class TurbasasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @turbasa = turbasas(:one)
  end

  test "should get index" do
    get turbasas_url
    assert_response :success
  end

  test "should get new" do
    get new_turbasa_url
    assert_response :success
  end

  test "should create turbasa" do
    assert_difference("Turbasa.count") do
      post turbasas_url, params: { turbasa: { contact: @turbasa.contact, country_id: @turbasa.country_id, name: @turbasa.name, region_id: @turbasa.region_id, town_id: @turbasa.town_id } }
    end

    assert_redirected_to turbasa_url(Turbasa.last)
  end

  test "should show turbasa" do
    get turbasa_url(@turbasa)
    assert_response :success
  end

  test "should get edit" do
    get edit_turbasa_url(@turbasa)
    assert_response :success
  end

  test "should update turbasa" do
    patch turbasa_url(@turbasa), params: { turbasa: { contact: @turbasa.contact, country_id: @turbasa.country_id, name: @turbasa.name, region_id: @turbasa.region_id, town_id: @turbasa.town_id } }
    assert_redirected_to turbasa_url(@turbasa)
  end

  test "should destroy turbasa" do
    assert_difference("Turbasa.count", -1) do
      delete turbasa_url(@turbasa)
    end

    assert_redirected_to turbasas_url
  end
end

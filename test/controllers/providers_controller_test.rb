require 'test_helper'

class ProvidersControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get providers__form_url
    assert_response :success
  end

  test "should get edit" do
    get providers_edit_url
    assert_response :success
  end

  test "should get index" do
    get providers_index_url
    assert_response :success
  end

  test "should get new" do
    get providers_new_url
    assert_response :success
  end

  test "should get show" do
    get providers_show_url
    assert_response :success
  end

end

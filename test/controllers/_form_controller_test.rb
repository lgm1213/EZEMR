require 'test_helper'

class FormControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get _form_edit_url
    assert_response :success
  end

  test "should get index" do
    get _form_index_url
    assert_response :success
  end

  test "should get new" do
    get _form_new_url
    assert_response :success
  end

  test "should get show" do
    get _form_show_url
    assert_response :success
  end

end

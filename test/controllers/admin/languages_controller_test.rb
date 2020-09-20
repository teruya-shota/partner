require 'test_helper'

class Admin::LanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_languages_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_languages_edit_url
    assert_response :success
  end

end

require 'test_helper'

class AttachementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attachement_index_url
    assert_response :success
  end

  test "should get new" do
    get attachements_new_url
    assert_response :success
  end

end
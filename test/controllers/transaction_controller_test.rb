require 'test_helper'

class TransactionControllerTest < ActionDispatch::IntegrationTest
  test "should get wallet" do
    get transaction_wallet_url
    assert_response :success
  end

  test "should get statements" do
    get transaction_statements_url
    assert_response :success
  end

end

require 'test_helper'

class ExchangeControllerTest < ActionController::TestCase
  test "should get clients_bill_exchange" do
    get :clients_bill_exchange
    assert_response :success
  end

end

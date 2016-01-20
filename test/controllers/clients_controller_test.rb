require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get get_credit" do
    get :get_credit
    assert_response :success
  end

  test "should get get_credit_information" do
    get :get_credit_information
    assert_response :success
  end

  test "should get checkout_credit" do
    get :checkout_credit
    assert_response :success
  end

  test "should get get_deposit" do
    get :get_deposit
    assert_response :success
  end

  test "should get get_deposit_information" do
    get :get_deposit_information
    assert_response :success
  end

  test "should get checkout_deposit" do
    get :checkout_deposit
    assert_response :success
  end

  test "should get client_informaton" do
    get :client_informaton
    assert_response :success
  end

  test "should get message" do
    get :message
    assert_response :success
  end

end

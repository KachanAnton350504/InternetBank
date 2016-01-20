require 'test_helper'

class DepositDepartmentControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get add_deposit" do
    get :add_deposit
    assert_response :success
  end

  test "should get details" do
    get :details
    assert_response :success
  end

  test "should get edit_deposit" do
    get :edit_deposit
    assert_response :success
  end

end

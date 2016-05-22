require 'test_helper'

class BillGeneratorsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new, xhr: true, format: 'js'
    assert_response :success
  end

  test "should create bill" do
    post :create, params: { bill_generator: { reference: Date.today.beginning_of_month } }

    assert_redirected_to bills_path
  end
end

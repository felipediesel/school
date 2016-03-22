require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    new_user = @user.dup
    new_user.email = "my@email.com"
    new_user.password = "123456789"
    new_user.password_confirmation = "123456789"

    assert_difference('User.count') do
      post :create, params: { user: { name: new_user.name, email: new_user.email, password: new_user.password, password_confirmation: new_user.password_confirmation } }
    end

    assert_redirected_to users_path
  end

  test "should get edit" do
    get :edit, params: { id: @user }
    assert_response :success
  end

  test "should update user" do
    patch :update, params: { id: @user,  user: { name: @user.name, email: @user.email, password: @user.password, password_confirmation: @user.password_confirmation } }
    assert_redirected_to users_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, params: { id: @user }
    end

    assert_redirected_to users_path
  end

  test "should not destroy current user" do
    sign_in users(:two)

    assert_no_difference('User.count') do
      delete :destroy, params: { id: @user }
    end

    assert_redirected_to users_path
  end
end

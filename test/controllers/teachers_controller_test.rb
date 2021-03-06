require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    @teacher = people(:lee)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher" do
    assert_difference('Teacher.count') do
      post :create, params: { teacher: { name: @teacher.name, code: 6 } }
    end

    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should show teacher" do
    get :show, params: { id: @teacher }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @teacher }
    assert_response :success
  end

  test "should update teacher" do
    patch :update, params: { id: @teacher, teacher: { name: @teacher.name, code: @teacher.code } }
    assert_redirected_to teacher_path(assigns(:teacher))
  end
end

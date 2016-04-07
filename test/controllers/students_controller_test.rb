require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = people(:daniel)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, params: { student: { name: @student.name, code: 5 } } # code validates uniqueness
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, params: { id: @student }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @student }
    assert_response :success
  end

  test "should update student" do
    patch :update, params: { id: @student, student: { name: @student.name, code: @student.code } }
    assert_redirected_to student_path(assigns(:student))
  end
end

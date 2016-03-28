require 'test_helper'

class StudentLevelsControllerTest < ActionController::TestCase
  setup do
    @student = people(:daniel)
    @student_level = student_levels(:one)
  end

  test "should get index" do
    get :index, params: { student_id: @student }
    assert_response :success
    assert_not_nil assigns(:student_levels)
  end

  test "should get new" do
    get :new, params: { student_id: @student, modality_id: @student_level.modality_id }
    assert_response :success
  end

  test "should create student_level" do
    assert_difference('StudentLevel.count') do
      process :create, method: :post, params: { student_id: @student, student_level: { modality_id: @student_level.modality_id, level_id: @student_level.level_id, date: @student_level.date } }
    end

    assert_redirected_to student_student_levels_path(@student)
  end

  test "should show student_level" do
    get :show, params: { student_id: @student, id: @student_level }, format: :json
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { student_id: @student, id: @student_level }
    assert_response :success
  end

  test "should update student_level" do
    process :update, method: :post, params: { student_id: @student, id: @student_level, student_level: { modality_id: @student_level.modality_id, level_id: @student_level.level_id, date: @student_level.date } }
    assert_redirected_to student_student_levels_path(@student)
  end

  test "should destroy student_level" do
    assert_difference('StudentLevel.count', -1) do
      delete :destroy, params: {student_id: @student, id: @student_level }
    end

    assert_redirected_to student_student_levels_path(@student)
  end
end

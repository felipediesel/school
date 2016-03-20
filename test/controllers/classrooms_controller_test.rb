require 'test_helper'

class ClassroomsControllerTest < ActionController::TestCase
  setup do
    @classroom = classrooms(:jiujitsu)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classrooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classroom" do
    assert_difference('Classroom.count') do
      post :create, classroom: { day_of_week: @classroom.day_of_week, duration: @classroom.duration, modality_id: @classroom.modality_id, name: @classroom.name, personal: @classroom.personal, room_id: @classroom.room_id, start_at: @classroom.start_at, teacher_id: @classroom.teacher_id }
    end

    assert_redirected_to classroom_path(assigns(:classroom))
  end

  test "should show classroom" do
    get :show, id: @classroom, format: :json
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classroom
    assert_response :success
  end

  test "should update classroom" do
    patch :update, id: @classroom, classroom: { day_of_week: @classroom.day_of_week, duration: @classroom.duration, modality_id: @classroom.modality_id, name: @classroom.name, personal: @classroom.personal, room_id: @classroom.room_id, start_at: @classroom.start_at, teacher_id: @classroom.teacher_id }
    assert_redirected_to classroom_path(assigns(:classroom))
  end

  test "should destroy classroom" do
    assert_difference('Classroom.count', -1) do
      delete :destroy, id: @classroom
    end

    assert_redirected_to classrooms_path
  end
end

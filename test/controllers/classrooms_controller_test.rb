require 'test_helper'

class ClassroomsControllerTest < ActionController::TestCase
  setup do
    @classroom = classrooms(:jiujitsu)
    @schedule = classroom_schedules(:jiujitsu)
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
      process :create, method: :post, params: { classroom: {
        title: @classroom.title, modality_id: @classroom.modality, duration: @classroom.duration , schedules_attributes: {
          '0' => { teacher_id: @schedule.teacher_id, room_id: @schedule.room_id, week_day: @schedule.week_day, start_at: @schedule.start_at}
        }
      }}

    end

    assert_redirected_to classrooms_path
  end

  test "should show classroom" do
    get :show, params: { id: @classroom }, format: :json
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @classroom }
    assert_response :success
  end

  test "should update classroom" do
    process :update, method: :post, params: { id: @classroom, classroom: {
        title: @classroom.title, modality_id: @classroom.modality, duration: @classroom.duration, schedules_attributes: {
          '0' => { teacher_id: @schedule.teacher_id, room_id: @schedule.room_id, week_day: @schedule.week_day, start_at: @schedule.start_at }
        }
      }}
    assert_redirected_to classrooms_path
  end

  test "should destroy classroom" do
    assert_difference('Classroom.count', -1) do
      delete :destroy, params: { id: @classroom }
    end

    assert_redirected_to classrooms_path
  end
end

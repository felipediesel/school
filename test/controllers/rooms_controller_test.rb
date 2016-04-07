require 'test_helper'

class RoomsControllerTest < ActionController::TestCase
  setup do
    @room = rooms(:main)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room" do
    assert_difference('Room.count') do
      post :create, params: { room: { name: @room.name } }
    end

    assert_redirected_to rooms_path
  end

  test "should show room" do
    get :show, params: { id: @room }, format: :json
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @room }
    assert_response :success
  end

  test "should update room" do
    patch :update, params: { id: @room, room: { name: @room.name } }
    assert_redirected_to rooms_path
  end

  test "should destroy room that have no classroom_schedules" do
    room = rooms(:fk_free)
    assert_difference('Room.count', -1) do
      delete :destroy, params: { id: room }
    end

    assert_redirected_to rooms_path
  end

  test "should not destroy room that have classroom_schedules" do
    delete :destroy, params: { id: @room }

    assert_response :method_not_allowed
  end
end

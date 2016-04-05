require 'test_helper'

class ModalitiesControllerTest < ActionController::TestCase
  setup do
    @modality = modalities(:jiujitsu)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modalities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modality" do
    assert_difference('Modality.count') do
      post :create, params: { modality: { name: @modality.name } }
    end

    assert_redirected_to modalities_path
  end

  test "should not show modality in html" do
    get :show, params: { id: @modality }, format: :json
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @modality }
    assert_response :success
  end

  test "should update modality" do
    patch :update, params: { id: @modality, modality: { name: @modality.name } }
    assert_redirected_to modalities_path
  end

  test "should destroy modality that have no classroom or student_levels" do
    modality = modalities(:fk_free)
    assert_difference('Modality.count', -1) do
      delete :destroy, params: { id: modality }
    end

    assert_redirected_to modalities_path
  end

  test "should not destroy modality that have classroom or student_levels" do
    delete :destroy, params: { id: @modality }

    assert_response :method_not_allowed
  end
end

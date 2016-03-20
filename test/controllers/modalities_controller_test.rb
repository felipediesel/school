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
      post :create, modality: { name: @modality.name }
    end

    assert_redirected_to modality_path(assigns(:modality))
  end

  test "should not show modality in html" do
    get :show, id: @modality, format: :json
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modality
    assert_response :success
  end

  test "should update modality" do
    patch :update, id: @modality, modality: { name: @modality.name }
    assert_redirected_to modality_path(assigns(:modality))
  end

  test "should destroy modality" do
    assert_difference('Modality.count', -1) do
      delete :destroy, id: @modality
    end

    assert_redirected_to modalities_path
  end
end

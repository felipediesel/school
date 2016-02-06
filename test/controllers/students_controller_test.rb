require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
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
      post :create, student: { birthday: @student.birthday, blood_type: @student.blood_type, cellphone: @student.cellphone, city: @student.city, code: @student.code, comment: @student.comment, country: @student.country, district: @student.district, document1: @student.document1, document2: @student.document2, email: @student.email, name: @student.name, phone: @student.phone, profession: @student.profession, responsible_document: @student.responsible_document, responsible_name: @student.responsible_name, state: @student.state, street: @student.street, zip: @student.zip }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { birthday: @student.birthday, blood_type: @student.blood_type, cellphone: @student.cellphone, city: @student.city, code: @student.code, comment: @student.comment, country: @student.country, district: @student.district, document1: @student.document1, document2: @student.document2, email: @student.email, name: @student.name, phone: @student.phone, profession: @student.profession, responsible_document: @student.responsible_document, responsible_name: @student.responsible_name, state: @student.state, street: @student.street, zip: @student.zip }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end

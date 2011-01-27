require 'test_helper'

class MedicalProceduresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_procedures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_procedure" do
    assert_difference('MedicalProcedure.count') do
      post :create, :medical_procedure => { }
    end

    assert_redirected_to medical_procedure_path(assigns(:medical_procedure))
  end

  test "should show medical_procedure" do
    get :show, :id => medical_procedures(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => medical_procedures(:one).to_param
    assert_response :success
  end

  test "should update medical_procedure" do
    put :update, :id => medical_procedures(:one).to_param, :medical_procedure => { }
    assert_redirected_to medical_procedure_path(assigns(:medical_procedure))
  end

  test "should destroy medical_procedure" do
    assert_difference('MedicalProcedure.count', -1) do
      delete :destroy, :id => medical_procedures(:one).to_param
    end

    assert_redirected_to medical_procedures_path
  end
end

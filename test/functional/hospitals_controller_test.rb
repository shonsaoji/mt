require 'test_helper'

class HospitalsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hospitals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hospital" do
    assert_difference('Hospital.count') do
      post :create, :hospital => { }
    end

    assert_redirected_to hospital_path(assigns(:hospital))
  end

  test "should show hospital" do
    get :show, :id => hospitals(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hospitals(:one).to_param
    assert_response :success
  end

  test "should update hospital" do
    put :update, :id => hospitals(:one).to_param, :hospital => { }
    assert_redirected_to hospital_path(assigns(:hospital))
  end

  test "should destroy hospital" do
    assert_difference('Hospital.count', -1) do
      delete :destroy, :id => hospitals(:one).to_param
    end

    assert_redirected_to hospitals_path
  end
end

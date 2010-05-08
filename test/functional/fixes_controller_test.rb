require 'test_helper'

class FixesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fixes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fix" do
    assert_difference('Fix.count') do
      post :create, :fix => { }
    end

    assert_redirected_to fix_path(assigns(:fix))
  end

  test "should show fix" do
    get :show, :id => fixes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fixes(:one).to_param
    assert_response :success
  end

  test "should update fix" do
    put :update, :id => fixes(:one).to_param, :fix => { }
    assert_redirected_to fix_path(assigns(:fix))
  end

  test "should destroy fix" do
    assert_difference('Fix.count', -1) do
      delete :destroy, :id => fixes(:one).to_param
    end

    assert_redirected_to fixes_path
  end
end

require 'test_helper'

class ChkOutInsControllerTest < ActionController::TestCase
  setup do
    @chk_out_in = chk_out_ins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chk_out_ins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chk_out_in" do
    assert_difference('ChkOutIn.count') do
      post :create, :chk_out_in => @chk_out_in.attributes
    end

    assert_redirected_to chk_out_in_path(assigns(:chk_out_in))
  end

  test "should show chk_out_in" do
    get :show, :id => @chk_out_in.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @chk_out_in.to_param
    assert_response :success
  end

  test "should update chk_out_in" do
    put :update, :id => @chk_out_in.to_param, :chk_out_in => @chk_out_in.attributes
    assert_redirected_to chk_out_in_path(assigns(:chk_out_in))
  end

  test "should destroy chk_out_in" do
    assert_difference('ChkOutIn.count', -1) do
      delete :destroy, :id => @chk_out_in.to_param
    end

    assert_redirected_to chk_out_ins_path
  end
end

require 'test_helper'

class ExcelsControllerTest < ActionController::TestCase
  setup do
    @excel = excels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:excels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create excel" do
    assert_difference('Excel.count') do
      post :create, excel: { name: @excel.name, url: @excel.url }
    end

    assert_redirected_to excel_path(assigns(:excel))
  end

  test "should show excel" do
    get :show, id: @excel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @excel
    assert_response :success
  end

  test "should update excel" do
    patch :update, id: @excel, excel: { name: @excel.name, url: @excel.url }
    assert_redirected_to excel_path(assigns(:excel))
  end

  test "should destroy excel" do
    assert_difference('Excel.count', -1) do
      delete :destroy, id: @excel
    end

    assert_redirected_to excels_path
  end
end

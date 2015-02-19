require 'test_helper'

class Photo2sControllerTest < ActionController::TestCase
  setup do
    @photo2 = photo2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo2" do
    assert_difference('Photo2.count') do
      post :create, photo2: { name: @photo2.name, url: @photo2.url }
    end

    assert_redirected_to photo2_path(assigns(:photo2))
  end

  test "should show photo2" do
    get :show, id: @photo2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo2
    assert_response :success
  end

  test "should update photo2" do
    patch :update, id: @photo2, photo2: { name: @photo2.name, url: @photo2.url }
    assert_redirected_to photo2_path(assigns(:photo2))
  end

  test "should destroy photo2" do
    assert_difference('Photo2.count', -1) do
      delete :destroy, id: @photo2
    end

    assert_redirected_to photo2s_path
  end
end

require 'test_helper'

class UsertagsControllerTest < ActionController::TestCase
  setup do
    @usertag = usertags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usertags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usertag" do
    assert_difference('Usertag.count') do
      post :create, usertag: { tag_id: @usertag.tag_id, user_id: @usertag.user_id }
    end

    assert_redirected_to usertag_path(assigns(:usertag))
  end

  test "should show usertag" do
    get :show, id: @usertag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usertag
    assert_response :success
  end

  test "should update usertag" do
    patch :update, id: @usertag, usertag: { tag_id: @usertag.tag_id, user_id: @usertag.user_id }
    assert_redirected_to usertag_path(assigns(:usertag))
  end

  test "should destroy usertag" do
    assert_difference('Usertag.count', -1) do
      delete :destroy, id: @usertag
    end

    assert_redirected_to usertags_path
  end
end

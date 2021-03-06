require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, name: @user.name, password: @user.password }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { email: @user.email, name: @user.name, password: @user.password }
    assert_redirected_to user_path(assigns(:user))
  end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete :destroy, id: @user
  #   end

  test "should have address, membership and groups" do
    assert_response :address
    assert_response :membership
    assert_response :groups
  end


  test "give me a list of users" do
    assert_equal 1, @users.length
    assert @users.first.is_a?(User)
    assert_equal "Joe", @users.first.name
        # assert_redirected_to users_path
  end
end


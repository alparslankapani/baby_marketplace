require 'test_helper'

class AgeRangesControllerTest < ActionController::TestCase
  setup do
    @age_range = age_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:age_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create age_range" do
    assert_difference('AgeRange.count') do
      post :create, age_range: { age: @age_range.age }
    end

    assert_redirected_to age_range_path(assigns(:age_range))
  end

  test "should show age_range" do
    get :show, id: @age_range
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @age_range
    assert_response :success
  end

  test "should update age_range" do
    patch :update, id: @age_range, age_range: { age: @age_range.age }
    assert_redirected_to age_range_path(assigns(:age_range))
  end

  test "should destroy age_range" do
    assert_difference('AgeRange.count', -1) do
      delete :destroy, id: @age_range
    end

    assert_redirected_to age_ranges_path
  end
end

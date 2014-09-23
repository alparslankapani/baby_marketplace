require 'test_helper'

class AdressInformationsControllerTest < ActionController::TestCase
  setup do
    @adress_information = adress_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adress_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adress_information" do
    assert_difference('AdressInformation.count') do
      post :create, adress_information: { adress: @adress_information.adress, cell_phone: @adress_information.cell_phone, city: @adress_information.city, postal_code: @adress_information.postal_code }
    end

    assert_redirected_to adress_information_path(assigns(:adress_information))
  end

  test "should show adress_information" do
    get :show, id: @adress_information
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adress_information
    assert_response :success
  end

  test "should update adress_information" do
    patch :update, id: @adress_information, adress_information: { adress: @adress_information.adress, cell_phone: @adress_information.cell_phone, city: @adress_information.city, postal_code: @adress_information.postal_code }
    assert_redirected_to adress_information_path(assigns(:adress_information))
  end

  test "should destroy adress_information" do
    assert_difference('AdressInformation.count', -1) do
      delete :destroy, id: @adress_information
    end

    assert_redirected_to adress_informations_path
  end
end

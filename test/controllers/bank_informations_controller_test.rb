require 'test_helper'

class BankInformationsControllerTest < ActionController::TestCase
  setup do
    @bank_information = bank_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bank_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bank_information" do
    assert_difference('BankInformation.count') do
      post :create, bank_information: { bank_account: @bank_information.bank_account, bank_name: @bank_information.bank_name }
    end

    assert_redirected_to bank_information_path(assigns(:bank_information))
  end

  test "should show bank_information" do
    get :show, id: @bank_information
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bank_information
    assert_response :success
  end

  test "should update bank_information" do
    patch :update, id: @bank_information, bank_information: { bank_account: @bank_information.bank_account, bank_name: @bank_information.bank_name }
    assert_redirected_to bank_information_path(assigns(:bank_information))
  end

  test "should destroy bank_information" do
    assert_difference('BankInformation.count', -1) do
      delete :destroy, id: @bank_information
    end

    assert_redirected_to bank_informations_path
  end
end

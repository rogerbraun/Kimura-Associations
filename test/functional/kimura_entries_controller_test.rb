require 'test_helper'

class KimuraEntriesControllerTest < ActionController::TestCase
  setup do
    @kimura_entry = kimura_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kimura_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kimura_entry" do
    assert_difference('KimuraEntry.count') do
      post :create, :kimura_entry => @kimura_entry.attributes
    end

    assert_redirected_to kimura_entry_path(assigns(:kimura_entry))
  end

  test "should show kimura_entry" do
    get :show, :id => @kimura_entry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @kimura_entry.to_param
    assert_response :success
  end

  test "should update kimura_entry" do
    put :update, :id => @kimura_entry.to_param, :kimura_entry => @kimura_entry.attributes
    assert_redirected_to kimura_entry_path(assigns(:kimura_entry))
  end

  test "should destroy kimura_entry" do
    assert_difference('KimuraEntry.count', -1) do
      delete :destroy, :id => @kimura_entry.to_param
    end

    assert_redirected_to kimura_entries_path
  end
end

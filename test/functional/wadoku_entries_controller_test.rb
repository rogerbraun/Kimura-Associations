require 'test_helper'

class WadokuEntriesControllerTest < ActionController::TestCase
  setup do
    @wadoku_entry = wadoku_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wadoku_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wadoku_entry" do
    assert_difference('WadokuEntry.count') do
      post :create, :wadoku_entry => @wadoku_entry.attributes
    end

    assert_redirected_to wadoku_entry_path(assigns(:wadoku_entry))
  end

  test "should show wadoku_entry" do
    get :show, :id => @wadoku_entry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wadoku_entry.to_param
    assert_response :success
  end

  test "should update wadoku_entry" do
    put :update, :id => @wadoku_entry.to_param, :wadoku_entry => @wadoku_entry.attributes
    assert_redirected_to wadoku_entry_path(assigns(:wadoku_entry))
  end

  test "should destroy wadoku_entry" do
    assert_difference('WadokuEntry.count', -1) do
      delete :destroy, :id => @wadoku_entry.to_param
    end

    assert_redirected_to wadoku_entries_path
  end
end

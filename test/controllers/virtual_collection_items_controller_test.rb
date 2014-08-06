require 'test_helper'

class VirtualCollectionItemsControllerTest < ActionController::TestCase
  setup do
    @virtual_collection_item = virtual_collection_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:virtual_collection_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create virtual_collection_item" do
    assert_difference('VirtualCollectionItem.count') do
      post :create, virtual_collection_item: {  }
    end

    assert_redirected_to virtual_collection_item_path(assigns(:virtual_collection_item))
  end

  test "should show virtual_collection_item" do
    get :show, id: @virtual_collection_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @virtual_collection_item
    assert_response :success
  end

  test "should update virtual_collection_item" do
    patch :update, id: @virtual_collection_item, virtual_collection_item: {  }
    assert_redirected_to virtual_collection_item_path(assigns(:virtual_collection_item))
  end

  test "should destroy virtual_collection_item" do
    assert_difference('VirtualCollectionItem.count', -1) do
      delete :destroy, id: @virtual_collection_item
    end

    assert_redirected_to virtual_collection_items_path
  end
end

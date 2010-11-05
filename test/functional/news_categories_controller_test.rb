require 'test_helper'

class NewsCategoriesControllerTest < ActionController::TestCase
  setup do
    @news_category = news_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_category" do
    assert_difference('NewsCategory.count') do
      post :create, :news_category => @news_category.attributes
    end

    assert_redirected_to news_category_path(assigns(:news_category))
  end

  test "should show news_category" do
    get :show, :id => @news_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @news_category.to_param
    assert_response :success
  end

  test "should update news_category" do
    put :update, :id => @news_category.to_param, :news_category => @news_category.attributes
    assert_redirected_to news_category_path(assigns(:news_category))
  end

  test "should destroy news_category" do
    assert_difference('NewsCategory.count', -1) do
      delete :destroy, :id => @news_category.to_param
    end

    assert_redirected_to news_categories_path
  end
end

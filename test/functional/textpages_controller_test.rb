require 'test_helper'

class TextpagesControllerTest < ActionController::TestCase
  setup do
    @textpage = textpages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:textpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create textpage" do
    assert_difference('Textpage.count') do
      post :create, textpage: { content: @textpage.content, hidden: @textpage.hidden, slug: @textpage.slug, title: @textpage.title }
    end

    assert_redirected_to textpage_path(assigns(:textpage))
  end

  test "should show textpage" do
    get :show, id: @textpage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @textpage
    assert_response :success
  end

  test "should update textpage" do
    put :update, id: @textpage, textpage: { content: @textpage.content, hidden: @textpage.hidden, slug: @textpage.slug, title: @textpage.title }
    assert_redirected_to textpage_path(assigns(:textpage))
  end

  test "should destroy textpage" do
    assert_difference('Textpage.count', -1) do
      delete :destroy, id: @textpage
    end

    assert_redirected_to textpages_path
  end
end

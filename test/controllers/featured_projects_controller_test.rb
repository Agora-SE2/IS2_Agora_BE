require 'test_helper'

class FeaturedProjectsControllerTest < ActionController::TestCase
  setup do
    @featured_project = featured_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:featured_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create featured_project" do
    assert_difference('FeaturedProject.count') do
      post :create, featured_project: { day: @featured_project.day, week: @featured_project.week, year: @featured_project.year }
    end

    assert_redirected_to featured_project_path(assigns(:featured_project))
  end

  test "should show featured_project" do
    get :show, id: @featured_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @featured_project
    assert_response :success
  end

  test "should update featured_project" do
    patch :update, id: @featured_project, featured_project: { day: @featured_project.day, week: @featured_project.week, year: @featured_project.year }
    assert_redirected_to featured_project_path(assigns(:featured_project))
  end

  test "should destroy featured_project" do
    assert_difference('FeaturedProject.count', -1) do
      delete :destroy, id: @featured_project
    end

    assert_redirected_to featured_projects_path
  end
end

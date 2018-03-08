require 'test_helper'

class LawProjectsControllerTest < ActionController::TestCase
  setup do
    @law_project = law_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:law_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create law_project" do
    assert_difference('LawProject.count') do
      post :create, law_project: { description: @law_project.description, name: @law_project.name, not_votes: @law_project.not_votes, publication_date: @law_project.publication_date, yes_votes: @law_project.yes_votes }
    end

    assert_redirected_to law_project_path(assigns(:law_project))
  end

  test "should show law_project" do
    get :show, id: @law_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @law_project
    assert_response :success
  end

  test "should update law_project" do
    patch :update, id: @law_project, law_project: { description: @law_project.description, name: @law_project.name, not_votes: @law_project.not_votes, publication_date: @law_project.publication_date, yes_votes: @law_project.yes_votes }
    assert_redirected_to law_project_path(assigns(:law_project))
  end

  test "should destroy law_project" do
    assert_difference('LawProject.count', -1) do
      delete :destroy, id: @law_project
    end

    assert_redirected_to law_projects_path
  end
end

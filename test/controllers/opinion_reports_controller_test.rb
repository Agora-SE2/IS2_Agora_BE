require 'test_helper'

class OpinionReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opinion_report = opinion_reports(:one)
  end

  test "should get index" do
    get opinion_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_opinion_report_url
    assert_response :success
  end

  test "should create opinion_report" do
    assert_difference('OpinionReport.count') do
      post opinion_reports_url, params: { opinion_report: { opinion_id: @opinion_report.opinion_id, reason: @opinion_report.reason, user_id: @opinion_report.user_id } }
    end

    assert_redirected_to opinion_report_url(OpinionReport.last)
  end

  test "should show opinion_report" do
    get opinion_report_url(@opinion_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_opinion_report_url(@opinion_report)
    assert_response :success
  end

  test "should update opinion_report" do
    patch opinion_report_url(@opinion_report), params: { opinion_report: { opinion_id: @opinion_report.opinion_id, reason: @opinion_report.reason, user_id: @opinion_report.user_id } }
    assert_redirected_to opinion_report_url(@opinion_report)
  end

  test "should destroy opinion_report" do
    assert_difference('OpinionReport.count', -1) do
      delete opinion_report_url(@opinion_report)
    end

    assert_redirected_to opinion_reports_url
  end
end

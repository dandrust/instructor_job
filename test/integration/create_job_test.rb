require 'test_helper'

class CreateJobTest < ActionDispatch::IntegrationTest

  def setup
    @valid_job = {company_name: "ProTrainings",
                       course: "BLS",
                       location: "Ada",
                       class_date: Date.new(2016, 12, 1),
                       class_time: DateTime.new(2016, 12, 1, 13, 30),
                       number_of_students: 15,
                       rate: 1000,
                       description: "ProTrainings needs some pro trainings",
                       needs_equipment: false, # They have those creepy heads in the back room
                       needs_insurance: false}

    @invalid_job = { # Missing company_name field
                       course: "BLS",
                       location: "Ada",
                       class_date: Date.new(2016, 12, 1),
                       class_time: DateTime.new(2016, 12, 1, 13, 30),
                       number_of_students: 15,
                       rate: 1000,
                       description: "ProTrainings needs some pro trainings",
                       needs_equipment: false, # They have those creepy heads in the back room
                       needs_insurance: false}
    end

  test "successful job creation by instructor" do
    get "instructor"
    assert assigns["new_job"]
    assert_difference("JobListing.count") do
      post "jobs", job_listing: @valid_job, role: "instructor"
      follow_redirect! # Instructor page
      assert_select 'div.alert-success'
      assert_select 'h4', {text: "ProTrainings", count: 0}
      get "admin"
      assert_select 'div.alert', 0
      assert_select 'div#pending' do
        assert_select "h4", "ProTrainings"
      end
    end
  end

  test "failed job creation by instructor" do
    get "instructor"
    assert_no_difference("JobListing.count") do
      post "jobs", job_listing: @invalid_job, role: "instructor"
      assert_select 'div.alert-danger'
    end
  end

  test "successful job creation by admin" do
    get "admin"
    assert assigns["new_job"]
    assert_difference("JobListing.count") do
      post "jobs", job_listing: @valid_job, role: "admin"
      follow_redirect! # Admin page
      assert_select "div.alert-success"
      assert_select "div#approved" do
        assert_select "h4", "ProTrainings"
      end
      get "instructor"
      assert_select "div.alert", 0
      assert_select "div#available" do
        assert_select "h4", "ProTrainings"
      end
    end
  end

  test "failed job creation by admin" do
    get "admin"
    assert_no_difference("JobListing.count") do
      post "jobs", job_listing: @invalid_job, role: "admin"
      assert_select "div.alert-danger"
    end
  end

end

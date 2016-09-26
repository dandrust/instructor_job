require 'test_helper'

class AwardJobTest < ActionDispatch::IntegrationTest
  fixtures :all

  def setup
    @job = job_listings(:sample_company_approved)
    @appl = job_applications(:dans_app)
  end

  test "award job by admin" do
    get "instructor"
    assert_select "div#available" do
      assert_select "h4", @job.company_name
    end
    get "admin"
    assert_select "div#approved" do
      assert_select "div.record#{@job.id.to_s}" do
        assert_select "h4", @job.company_name
        assert_select "form select"
      end
    end
    assert_difference("JobListing.where('awarded_application_id = #{@appl.id.to_s}').count") do
      put "jobs/#{@job.id.to_s}", job_listing: {awarded_application_id: @appl.id.to_s}, id: @job.id.to_s
    end
    follow_redirect!
    assert assigns[:role] == "admin"
    assert_select "div.alert-success"
    assert_select "div#awarded" do
      assert_select "h4", @job.company_name
    end
    get "instructor"
    assert_select "div#awarded" do
      assert_select "h4", @job.company_name
    end

  end

end

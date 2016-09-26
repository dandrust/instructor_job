require 'test_helper'

class JobApprovalTest < ActionDispatch::IntegrationTest
  fixtures :job_listings

  def setup
    @job = job_listings(:sample_company_unapproved)
  end

  test "approve job by admin" do
    get "instructor"
    assert_select "h4", {text: @job.company_name, count: 0 }
    get "admin"
    assert_select "div#pending" do
      assert_select "div.record" + @job.id.to_s do
        assert_select "h4", @job.company_name
        assert_select "form input[value='Approve']"
      end
    end
    assert_difference("JobListing.where('approved = true').count") do
      put "jobs/#{@job.id}", {id: @job.id.to_s, job_listing: { approved: "true" }}
    end
    follow_redirect!
    assert assigns[:role] == "admin"
    assert_select "div.alert-success"
    assert_select "div#approved" do
      assert_select "h4", @job.company_name
    end
    get "instructor"
    assert_select "div#available" do
      assert_select "h4", @job.company_name
    end

  end
end

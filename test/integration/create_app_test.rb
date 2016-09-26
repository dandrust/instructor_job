require 'test_helper'

class CreateAppTest < ActionDispatch::IntegrationTest
  fixtures :job_listings

  def setup
    @job = job_listings(:sample_company_approved)

    @valid_app = {job_listing_id: @job.id,
                  name: "Dan Drust",
                  email: "dan@example.com"}
    @invalid_app = {job_listing_id: 1,
                  # Missing name
                  email: "dan@example.com"}
  end

  test "successful app creation by instructor" do
    get "instructor"
    assert assigns["new_app"]
    assert_difference("JobApplication.count") do
      post "apps", job_application: @valid_app
      follow_redirect!
      assert_select "div.alert-success"
    end
    get "admin"
    assert_select "div#approved" do
      assert_select "div.record" + @job.id.to_s do
        assert_select "form select option", @valid_app[:name]
      end
    end
  end

  test "failed app creation by instructor" do
    get "instructor"
    assert_no_difference("JobApplication.count") do
      post "apps", job_application: @invalid_app
      assert_select "div.alert-danger"
    end

  end
end

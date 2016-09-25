require 'test_helper'

class JobApplicationTest < ActiveSupport::TestCase

  def setup
    @app = JobApplication.new(name: "Test User",
                              email: "test_user@example.com",
                              comments: "Here are some comments",
                              job_listing_id: 1)
  end

  test "should be valid" do
    assert @app.valid?
  end

  test "name should be present" do
    @app.name = ""
    assert @app.invalid?
  end

  test "email should be present" do
    @app.email = ""
    assert @app.invalid?
  end

  test "email should be vaild" do
    @app.email = "example"
    assert @app.invalid?, "'example' passed as valid"
    @app.email << "@email"
    assert @app.invalid?, "'example@email' passed as valid"
    @app.email << ".comn"
    assert @app.invalid?, @app.email
  end

  test "comments should be optional" do
    @app.comments = ""
    assert @app.valid?
  end

  test "job listing id must be present" do
    @app.job_listing_id = nil
    assert @app.invalid?
  end

end

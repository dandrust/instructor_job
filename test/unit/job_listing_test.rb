require 'test_helper'

class JobListingTest < ActiveSupport::TestCase

  def setup
    @job = JobListing.new( company_name: "Example Company",
                           course: "BLS",
                           location: "Anytown",
                           class_date: Date.new(2016, 12, 1),
                           class_time: DateTime.new(2016, 12, 1, 2, 3, 4),
                           number_of_students: 20,
                           rate: 20.00,
                           description: "Teach BLS to  staff at Company",
                           needs_equipment: true,
                           needs_insurance: false)
  end

  test "should be valid" do
    assert @job.valid?
  end

  test "company name should be present" do
    @job.company_name = ""
    assert @job.invalid?
  end

  test "course should be present" do
    @job.course = "  "
    assert @job.invalid?
  end

  test "location should be present" do
    @job.location = "  "
    assert @job.invalid?
  end

  test "class time should be present" do
    @job.class_time = " "
    assert @job.invalid?
  end

  #Need a test for format of date, time

  test "class date should be present" do
    @job.class_date = "  "
    assert @job.invalid?
  end

  test "number of students should be present" do
    @job.number_of_students = " "
    assert @job.invalid?
  end

  test "number of students should be an integer only" do
    @job.number_of_students = "string"
    assert @job.invalid?
    @job.number_of_students = 2.5
    assert @job.invalid?
  end

  test "rate should be present" do
    @job.rate = " "
    assert @job.invalid?
  end

  test "rate should have precision up to 6 and scale up to 2" do
    @job.rate = 10000.50
    assert @job.invalid?
  end

  test "rate should be positive" do
    @job.rate = -1
    assert @job.invalid?
  end

  test "approved should default to false on save" do
    @job.save!
    assert_equal false, JobListing.first.approved
  end



end

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :new_model_instances
  before_filter :available_courses
  before_filter :available_jobs
  before_filter :awarded_jobs
  before_filter :pending_jobs

  private

  def new_model_instances
    @new_job ||= JobListing.new
    @new_app ||= JobApplication.new
  end

  def available_courses
    @available_courses = [
      ["First Aid at Work", "First Aid at Work"],
      ["BLS", "BLS"],
      ["Fire Safety", "Fire Safety"],
      ["Food Safety", "Food Safety"],
      ["Manual Handling", "Manual Handling"]
    ]
  end

  def available_jobs
    @available_jobs = JobListing.where("awarded_application_id IS NULL AND approved = true")
                                .order("class_date DESC")
  end

  def awarded_jobs
    @awarded_jobs = JobListing.find_by_sql("SELECT job_listings.*, job_applications.name FROM job_listings INNER JOIN job_applications ON job_listingS.awarded_application_id=job_applications.id ORDER BY job_listings.class_date DESC LIMIT 10")

  end

  def pending_jobs
    @pending_jobs = JobListing.where(approved: false)
                              .order("class_date DESC")
  end


end

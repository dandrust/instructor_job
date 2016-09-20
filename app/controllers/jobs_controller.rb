class JobsController < ApplicationController
  before_filter :available_courses
  before_filter :available_jobs

  def new
  end

  def show
  end

  def create
    @new_job = JobListing.new(params[:job_listing])
    if @new_job.save
      flash[:success] = []
      flash[:success].push("Job successfully created")
      redirect_to jobs_path
    else
      flash.now[:danger] = []
      @new_job.errors.messages.each do |field, message|
        flash.now[:danger].push("#{field.to_s.humanize} #{message.first}")
      end
      render :index
    end

  end

  def index
    @new_job = JobListing.new


  end

  private

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
    @available_jobs = JobListing.where(" approved = true")
                                .order("class_date DESC")
                                .limit(10)
                                #awarded_application_id IS NULL AND
  end


end

class JobsController < ApplicationController
  def new
  end

  def show
  end

  def create
    @new_job = JobListing.new(params[:job_listing])
    @new_job.save
    redirect_to jobs_path

  end


  def index
    @available_courses = [
      ["First Aid at Work", "First Aid at Work"],
      ["BLS", "BLS"],
      ["Fire Safety", "Fire Safety"],
      ["Food Safety", "Food Safety"],
      ["Manual Handling", "Manual Handling"]
    ]

    @new_job = JobListing.new
  end

  private
    def new_job_params
      params.require(:job_listing)
            .permit(:company_name, :course, :location, :class_date,
                    :class_time, :number_of_students, :rate,
                    :description, :needs_equipment, :needs_insurance)
    end


end

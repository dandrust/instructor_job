class JobsController < ApplicationController

  ###
  # Creation of new Job listing
  #
  # Because both instructors and admins can create jobs, but
  # the record must be treated differently in the two cases,
  # this method looks at params field 'role' before saving the
  # new record
  ###
  def create
    # debugger
    # Assign form body to new instance of JobListing
    @new_job = JobListing.new(params[:job_listing])

    # Automatically approve listing if user is admin
    if params[:role] == 'admin'
      @new_job[:approved] = true
    end

    # On success, write flash and redirect; on failure, write flash and render
    if @new_job.save
      flash[:success] = "Job successfully created"
      redirect_to admin_path
    else
      render 'static_pages/index'
    end

  end

end

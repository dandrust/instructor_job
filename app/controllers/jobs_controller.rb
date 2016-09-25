class JobsController < ApplicationController

  def create
    @new_job = JobListing.new(params[:job_listing])

    if params[:role] == 'admin'
      @new_job[:approved] = true
    end

    if @new_job.save
      flash[:success] = "Job successfully created"
      redirect_to admin_path if params[:role] == "admin"
      redirect_to instructor_path if params["role"] == "instructor"
    else
      @role = params[:role]
      render 'static_pages/index'
    end

  end

  def update

    @job_listing = JobListing.find(params[:id].to_i)

    if params[:job_listing].key? "approved"
      @job_listing.approved = true
      if @job_listing.save
        flash[:success] = "Job successfully approved"
      else
        flash[:danger] = "There was a problem approving the job.  Please contact support."
      end
      redirect_to admin_path

    elsif params[:job_listing].key? "awarded_application_id"
      @job_listing.awarded_application_id = params[:job_listing][:awarded_application_id]
      if @job_listing.save
        flash[:success] = "Job successfully awarded"
      else
        flash[:danger] = "There was a problem awarding the job. Please contact support."
      end
      redirect_to admin_path

    else
      flash[:danger] = "There was a problem handling your request. Please contact support."
      redirect_to admin_path

    end

  end

end

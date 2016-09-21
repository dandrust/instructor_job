class JobsController < ApplicationController

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
    @new_app = JobApplication.new
  end


end

class AppsController < ApplicationController

def create
  @new_app = JobApplication.new(params[:job_application])
  if @new_app.save
    flash[:success] = []
    flash[:success].push("Application saved")
    redirect_to jobs_path
  else
    @role = 'instructor'
    render 'static_pages/index'
  end
end

end

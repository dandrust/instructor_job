class AppsController < ApplicationController

def create
  @new_app = JobApplication.new(params[:job_application])
  if @new_app.save
    flash[:success] = "Application saved"
    redirect_to instructor_path
  else
    @role = 'instructor'
    render 'static_pages/index'
  end
end

end

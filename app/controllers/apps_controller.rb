class AppsController < ApplicationController

def create
  @new_app = JobApplication.new(params[:job_application])
  if @new_app.save
    flash[:success] = []
    flash[:success].push("Application saved")
    redirect_to jobs_path
  else
    flash.now[:danger] = []
    @new_app.errors.messages.each do |field, message|
      flash.now[:danger].push("#{field.to_s.humanize} #{message.first}")
    end
    render 'jobs/index'
  end
end

end

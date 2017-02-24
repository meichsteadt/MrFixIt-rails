class JobsController < ApplicationController
  before_action :authenticate_worker
  skip_before_action :authenticate_worker, only: [:show, :index]

  def index
    @jobs = Job.all
  end

  def new
   @job = Job.new
   render :new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if current_worker
      if @job.update(job_params)
          respond_to do |format|
          format.html { redirect_to jobs_path() }
          format.js
        end
      else
        render :show
        flash[:notice] = "Something went wrong!"
      end
    else
      # We need to streamline this process better in the future! - Mr. Fix-It.
      flash[:notice] = 'You must have a worker account to claim a job. Register for one using the link in the navbar above.'
      redirect_to new_user_registration_path
    end
  end


private

  def job_params
    params.require(:job).permit(:title, :description, :in_work, :completed, :worker_id, :pending)
  end

end

class JobsController < ApplicationController
	def index
		@jobs = Job.all
	end

	def show
		@job = Job.find(params[:id])
	end

	def new
		@job = Job.new
	end

	def create
		@job = current_user.jobs.new(job_params)
		if @job.save
			redirect_to @job
		else
			render 'new'
		end
	end

	private
		def job_params
			params.require(:job).permit(:title, :description, :salary)
		end
end
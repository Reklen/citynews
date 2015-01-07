class JobsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

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

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])

		if @job.update(job_params)
			redirect_to @job
		else
			render 'edit'
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.delete
		flash[:notice] = "Emprego apagado com sucesso"
		redirect_to root_path
	end

	private
		def job_params
			params.require(:job).permit(:title, :description, :salary)
		end
end
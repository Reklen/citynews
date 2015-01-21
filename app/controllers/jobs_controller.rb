class JobsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_job, only: [:show, :create, :update, :destroy]

	def index
		@jobs = Job.all
	end

	def show
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
	end

	def update
		if @job.update(job_params)
			redirect_to @job
		else
			render 'edit'
		end
	end

	def destroy
		@job.delete
		flash[:notice] = "Emprego apagado com sucesso"
		redirect_to root_path
	end

	private
		def job_params
			params.require(:job).permit(:title, :description, :salary)
		end

		def set_job
			@job = current_user.jobs.find(params[:id])
		end
end